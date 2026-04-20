import uuid

import bcrypt
from fastapi import Depends, HTTPException

from server.models.user import User
from server.pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from server.database import get_db
from sqlalchemy.orm import Session

router = APIRouter()

@router.post('/signup')
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