import bcrypt ,time, random
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.db import connection
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework import status
import pytz
from django.utils import timezone

from auth_api.utils.ip_utils import get_client_ip
from auth_api.utils.browser_utils import get_browser_info
from auth_api.utils.jwt_utils import generate_jwt_token


@api_view(["POST"])
@permission_classes([AllowAny])
def login_user(request):
    client_ip = get_client_ip(request)
    browser, os = get_browser_info(request)
    ist = pytz.timezone("Asia/Kolkata")
    created_at = timezone.now().astimezone(ist)

    email = request.data.get("email")
    password = request.data.get("password")

    if not email or not password:
        return Response(
            {"error": True, "message": "Email and password are required"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    # FIXED SQL
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT user_id, email, password_hash
            FROM users 
            WHERE email = %s
        """, [email])
        row = cursor.fetchone()

    if not row:
        return Response(
            {"error": True, "message": "Invalid credentials"},
            status=status.HTTP_401_UNAUTHORIZED,
        )

    user_id, email, hashed_password = row

    # Validate password
    if not bcrypt.checkpw(password.encode(), hashed_password.encode()):
        return Response(
            {"error": True, "message": "Invalid email or password"},
            status=status.HTTP_401_UNAUTHORIZED,
        )

    # FIX LOGIN_LOGS (column name might be user or user_id)
    with connection.cursor() as cursor:
        cursor.execute("""
            INSERT INTO login_logs (user_id, ip_address, browser, os, login_time, country)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, [user_id, client_ip, browser, os, created_at, "India"])

    # Generate JWT
    token = generate_jwt_token(user_id, email)

    return Response(
        {
            "error": False,
            "message": "Login successful",
            "access_token": token,
            "data": {
                "id": user_id,
                "email": email,
            },
        },
        status=status.HTTP_200_OK,
    )


