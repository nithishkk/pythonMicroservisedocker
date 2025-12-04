from django.urls import path
# from .views import register, login_user, refresh_token
from .views import login_user


urlpatterns = [
    # path("register/", register),
    path("login/", login_user, name="login"),  # add slash and name
    # path("refresh/", refresh_token),
]
