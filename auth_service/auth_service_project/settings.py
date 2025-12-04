from pathlib import Path
from datetime import timedelta
from decouple import config
import os

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = "your-secret-key"
DEBUG = True

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "corsheaders",
    "rest_framework",
    "rest_framework_simplejwt.token_blacklist",
    "auth_api",
]

MIDDLEWARE = [
    "corsheaders.middleware.CorsMiddleware",     # FIRST

    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",

    "django.middleware.csrf.CsrfViewMiddleware",

    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
]

ROOT_URLCONF = "auth_service_project.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "auth_service_project.wsgi.application"

# DATABASES = {
#     "default": {
#         "ENGINE": "django.db.backends.mysql",
#         "NAME": config("MYSQL_DATABASE", default="erpData"),
#         "USER": config("MYSQL_USER", default="root"),
#         "PASSWORD": config("MYSQL_PASSWORD", default="Root@1234"),
#         "HOST": config("MYSQL_HOST", default="localhost"),   # 🔥 FIXED
#         "PORT": config("MYSQL_PORT", default=3306, cast=int),
#     }
# }

# DATABASES = {
#     "default": {
#         "ENGINE": "django.db.backends.mysql",
#         "NAME": "erpData",
#         "USER": "root",
#         "PASSWORD": "Root@1234",
#         "HOST": "localhost",   # ← ONLY works inside Docker
#         "PORT": 3306,
#     }
# }

# DATABASES = {
#     "default": {
#         "ENGINE": "django.db.backends.mysql",
#         "NAME": os.getenv("MYSQL_DATABASE", "erpData"),
#         "USER": os.getenv("MYSQL_USER", "root"),
#         "PASSWORD": os.getenv("MYSQL_PASSWORD", "Root@1234"),
#         "HOST": os.getenv("MYSQL_HOST", "mysql_db"),
#         "PORT": os.getenv("MYSQL_PORT", "3306"),
#         "OPTIONS": {
#             "ssl": {"disabled": True},     # 🔥 DISABLE SSL
#         },
#     }
# }


# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'erpData',
#         'USER': 'root',
#         'PASSWORD': 'Root@1234',
#         'HOST': 'db',
#         'PORT': '3306',
#     }
# }



# DATABASES = {
#     "default": {
#         "ENGINE": "django.db.backends.mysql",
#         "NAME": config("MYSQL_DATABASE", default="erpData"),
#         "USER": config("MYSQL_USER", default="root"),
#         "PASSWORD": config("MYSQL_PASSWORD", default="Root@1234"),
#         "HOST": config("MYSQL_HOST", default="localhost"),
#         "PORT": config("MYSQL_PORT", default=3306, cast=int),
#     }
# }
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'erpData',
#         'USER': 'root',
#         'PASSWORD': 'Root@1234',
#         'HOST': 'mysql',
#         'PORT': '3306',
#     }
# }


# DATABASES = {
#     "default": {
#         "ENGINE": "django.db.backends.mysql",
#         "NAME": "erpData",
#         "USER": "root",
#         "PASSWORD": "Root@1234",
#         "HOST": "localhost",
#         "PORT": 3306,
#     }
# }



# DATABASES = {
#     "default": {
#         "ENGINE": "django.db.backends.mysql",
#         "NAME": os.getenv("MYSQL_DATABASE", "erpData"),
#         "USER": os.getenv("MYSQL_USER", "root"),
#         "PASSWORD": os.getenv("MYSQL_PASSWORD", "Root@1234"),
#         "HOST": os.getenv("MYSQL_HOST", "mysql_db"),  # TCP here
#         "PORT": os.getenv("MYSQL_PORT", "3307"),
#         "OPTIONS": {
#             "init_command": "SET sql_mode='STRICT_TRANS_TABLES'",
#             "charset": "utf8mb4",
#             "use_unicode": True,
#         },
#     }
# }

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'erpData',
        'USER': 'root',
        'PASSWORD': 'Root@1234',
        'HOST': 'mysql_database',   # VERY IMPORTANT
        'PORT': '3306',       # Inside-docker port
    }
}




AUTH_PASSWORD_VALIDATORS = []

LANGUAGE_CODE = "en-us"
TIME_ZONE = "Asia/Kolkata"
USE_I18N = True
USE_TZ = True

STATIC_URL = "static/"

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

# CORS
CORS_ALLOW_HEADERS = ["*"]
CORS_EXPOSE_HEADERS = ["*"]
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True

CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
]

CSRF_TRUSTED_ORIGINS = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
]

ALLOWED_HOSTS = [
    "*",
    "auth_backend",     # Docker service name used by Nginx upstream
    "api_gateway",      # if gateway calls it by this name
    "localhost",
    "127.0.0.1",
    "auth_service"
]




REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": (
        "rest_framework_simplejwt.authentication.JWTAuthentication",
    ),
    "DEFAULT_PARSER_CLASSES": [
        "rest_framework.parsers.JSONParser",
    ],
}

SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(minutes=15),
    "REFRESH_TOKEN_LIFETIME": timedelta(days=7),
    "ROTATE_REFRESH_TOKENS": True,
    "BLACKLIST_AFTER_ROTATION": True,
}
