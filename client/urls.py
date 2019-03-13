from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('client/signup/', views.client_signup, name='client_signup'),
    path('client/signup/addData/', views.client_add, name='client_add'),
    path('client/dashboard/', views.dashboard, name='dashboard'),
    path('client/account-details', views.account_details, name='account_details'),
    path('client/payment-invoice', views.payment_invoice, name='payment_invoice'),
    path('client/payments', views.payments, name='payments'),
    path('client/service-status', views.service_status, name='service_status'),
    
]
