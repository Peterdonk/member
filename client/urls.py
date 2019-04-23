from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('', views.IndexView.as_view(), name="LandingPage"),
    path('client/login', views.LoginView.as_view(), name="LoginPage"),
    path('client/signup/', views.SignupView.as_view(),name="SignupPage"),
    path('client/dashboard/', views.dashboard, name='dashboard'),
    path('client/account-details', views.AccountDetails.as_view(), name='AccountDetails'),
    path('client/payment-invoice', views.payment_invoice, name='payment_invoice'),
    path('client/payments', views.Payments.as_view(), name='Payments'),
    path('client/service-status', views.ServiceStatus.as_view(), name='ServiceStatus'),
    path('client/add-service', views.add_service, name='add_service'),
    path('client/service-tickets', views.ServiceTickets.as_view(), name='ServiceTickets'),
    path('client/ticket-details', views.ticket_details, name='ticket_details'),
    path('client/logged_in', views.logged_in, name='logged_in'),
    
]
