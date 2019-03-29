from django.contrib.auth import views as auth_views
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('client/signup/', views.client_signup, name='client_signup'),
    path('client/dashboard/', views.dashboard, name='dashboard'),
    path('client/account-details', views.account_details, name='account_details'),
    path('client/payment-invoice', views.payment_invoice, name='payment_invoice'),
    path('client/payments', views.payments, name='payments'),
    path('client/service-status', views.service_status, name='service_status'),
    path('client/add-service', views.add_service, name='add_service'),
    path('client/service-tickets', views.service_tickets, name='service_tickets'),
    path('client/ticket-details', views.ticket_details, name='ticket_details'),
    path('client/logged_in', views.logged_in, name='logged_in'),
    
]
