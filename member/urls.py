from django.contrib import admin
from django.urls import path,include
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('administrator/',include('administrator.urls')),
    path('admin/', admin.site.urls),
    path('', include('client.urls')),
    path('client/dashboard/', include('client.urls'), name="dashboard"),
    path('client/account-details', include('client.urls'), name="account_details"),
    path('client/payments', include('client.urls'), name="payments"),
    path('client/payment-invoice', include('client.urls'), name="payment_invoice"),
    path('client/service-status', include('client.urls'), name="service_status"),
    path('client/add-service', include('client.urls'), name="add_service"),
    path('client/service-tickets', include('client.urls'), name="service_tickets"),
    path('client/ticket-details', include('client.urls'), name="ticket_details"),
    path('client/signup/', include('client.urls')),
    path('client/login/',auth_views.LoginView.as_view(template_name='client/login.html'), name='login'),
    path('client/logged_in/', include('client.urls'), name="logged_in"),
    path('client/password-reset/',auth_views.PasswordResetView.as_view(template_name = 'client/password_reset.html'), name = 'password_reset'),
    path('client/password-reset/done',auth_views.PasswordResetDoneView.as_view(template_name = 'client/password_reset_done.html'), name= 'password_reset_done'),
    path('client/password-reset-confirm/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='client/password_reset_confirm.html'), name='password_reset_confirm'),
     path('client/password-reset-complete/', auth_views.PasswordResetCompleteView.as_view(template_name='client/password_reset_complete.html'), name='password_reset_complete'),  
]	

