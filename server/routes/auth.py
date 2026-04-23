import os
import uuid

import bcrypt
from fastapi import Depends, HTTPException, Header
import jwt

from models.user import User
from pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from database import get_db
from sqlalchemy.orm import Session

from pydantic_schemas.user_login import UserLogin

from dotenv import load_dotenv

from middleware.auth_middleware import auth_middleware

load_dotenv()
SECRET_KEY = os.getenv('SECRET_KEY')

router = APIRouter()

@router.post('/signup', status_code=201)
def signup_user(user: UserCreate, db: Session=Depends(get_db)):
    # check if the user already exist in the db
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        raise HTTPException(400, 'User with the same email already exists!')
    
    hashed_pw = bcrypt.hashpw(password= user.password.encode() ,salt=bcrypt.gensalt())
    
    user_db = User(id = str(uuid.uuid4()), name = user.name, email = user.email, password = hashed_pw)
    # add the user to the db
    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db

@router.post('/login')
def login_user(user: UserLogin, db: Session=Depends(get_db)):
    # check if the user with the same email exist
    user_db = db.query(User).filter(User.email == user.email).first()

    if not user_db:
        raise HTTPException(400, 'User does not exists!')
    
    # if the password matching
    is_match = bcrypt.checkpw(user.password.encode(), user_db.password)

    if not is_match:
        raise HTTPException(400, 'Incorrect Credentials!')
    
    token = jwt.encode({'id': user_db.id},SECRET_KEY)
    
    return {'token':token, 'user': user_db}

@router.get('/')
def get_current_user(db: Session=Depends(get_db), user_dict = Depends(auth_middleware)):
    user = db.query(User).filter(User.id == user_dict['uid']).first()

    if not user:
        raise HTTPException(404, 'User not found!')
    
    return user