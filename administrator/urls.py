from django.urls import path
from . import views


urlpatterns = [
    path('register/', views.register, name='register'), 
    path('client/manage/edit/<int:id>', views.edit_client, name='edit_client'),
    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('client/pending', views.pending_clients, name='pending_clients'),
    path('client/registered', views.registered_clients, name='registered_clients'),
    path('client/manage', views.manage_clients, name='manage_clients'),
    path('client/print', views.print_client, name='print_client'),
    path('account/view', views.view_account, name='view_account'),
    path('account/payment/<int:id>', views.manage_account, name='manage_account'),
    path('invoice/view', views.view_invoice, name='view_invoice'),
    path('invoice/manage/<int:id>', views.manage_invoice, name='mamange_invoice'),
    path('ticket/view', views.view_tickets, name='view_tickets'),
    path('ticket/manage/<int:id>', views.manage_tickets, name='manage_tickets'),
    path('inventory/view', views.view_inventory, name='view_inventory'),
    path('inventory/manage', views.manage_inventory, name='manage_inventory'),


]
