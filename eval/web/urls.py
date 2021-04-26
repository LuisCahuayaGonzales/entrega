from django.urls import path
from web.views import IndexView
from web.views import LoginView
from web.views import DetailView
from web.views import RegisterView
from web.views import LogoutView

urlpatterns = [
    path('', LoginView.as_view()),
    path('logout', LogoutView.as_view()),
    path('home', IndexView.as_view()),
    path('new', RegisterView.as_view()),
    path('product/<id>', DetailView.as_view()),
]