from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('client/signup/', views.client_signup, name='client_signup')
    
]
