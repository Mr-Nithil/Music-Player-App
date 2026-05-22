# Music-Player-App

## Commands

### Server (FastAPI)

From the [server](server) folder:

```bash
python3 -m venv venv
source venv/bin/activate
pip install fastapi sqlalchemy python-dotenv bcrypt pyjwt cloudinary
fastapi run main.py
```

Optional (only if you see a Postgres driver error):

```bash
pip install psycopg2-binary
```

For dev reload (optional):

```bash
fastapi dev main.py
```

Environment variables live in [server/.env](server/.env):

```
DATABASE_URL=postgresql://<user>@<host>:<port>/<db>
SECRET_KEY=<random-secret>
CLOUDINARY_CLOUD_NAME=<cloudinary-name>
CLOUDINARY_API_KEY=<cloudinary-key>
CLOUDINARY_API_SECRET=<cloudinary-secret>
```

### Client (Flutter)

From the [client](client) folder:

```bash
flutter pub get
flutter run
```

Web run (optional):

```bash
flutter run -d chrome
```

### Code Generation (Riverpod)

From the [client](client) folder:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Watch mode:

```bash
dart run build_runner watch --delete-conflicting-outputs
```
