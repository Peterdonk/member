
from django.contrib import admin
from django.urls import path,include
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('client.urls')),
    path('client/signup/', include('client.urls')),
    path('client/login/',auth_views.LoginView.as_view(template_name='client/login.html')),
    path('client/password-reset/',auth_views.PasswordResetView.as_view(template_name = 'client/password_reset.html'), name = 'password_reset'),
    path('client/password-reset/done',auth_views.PasswordResetDoneView.as_view(template_name = 'client/password_reset_done.html'), name= 'password_reset_done'),
    path('client/password-reset-confirm/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='client/password_reset_confirm.html'), name='password_reset_confirm'),
     path('client/password-reset-complete/', auth_views.PasswordResetCompleteView.as_view(template_name='client/password_reset_complete.html'), name='password_reset_done'),  
]	

