import jwt
from django.conf import settings
from datetime import datetime, timedelta

def generate_jwt_token(user_id, email):
    payload = {
        "user_id": user_id,
        "email": email,
        "exp": datetime.utcnow() + timedelta(hours=1),
        "iat": datetime.utcnow()
    }

    return jwt.encode(payload, settings.SECRET_KEY, algorithm="HS256")
