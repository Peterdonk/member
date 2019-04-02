from django.urls import path
from . import views


urlpatterns = [
    path('', views.register, name='register'), 
    path('dashboard', views.admin_dashboard, name='admin_dashboard' ) 
]
