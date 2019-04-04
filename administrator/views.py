from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages

# Create your views here.

def register(request):
	if request.method == "POST":
		#Getting values from post
		get_admin_name = request.POST.get('admin_username')
		get_admin_email = request.POST.get('admin_email')
		get_admin_password = request.POST.get('admin_password')
		get_admin_key = request.POST.get('admin_secret_key')

		if get_admin_key == "!!!@L0g1nReg1ster@!!!":
			#saving the post
			admin_add = User.objects.create_user(username=get_admin_name,
		                email=get_admin_email,password=get_admin_password,is_superuser=1)
			if admin_add:
				return redirect('login')
		else:
			messages.error(request, 'Please Enter Secret Password.')
			return render(request,'administrator/register.html')

	return render(request,'administrator/register.html')

@login_required
def admin_dashboard(request):
	return render(request,'administrator/index.html')

@login_required
def pending_clients(request):
	return render(request,"administrator/pending_clients.html")

@login_required
def registered_clients(request):
	return render(request,"administrator/registered_clients.html")

@login_required
def manage_clients(request):
	return render(request,"administrator/manage_clients.html")

@login_required
def print_client(request):
	return render(request,"administrator/print_client_form.html")

@login_required
def view_account(request):
	return render(request,"administrator/view_payments.html")

@login_required
def manage_account(request):
	return render(request,"administrator/make_payments.html")

@login_required
def view_invoice(request):
	return render(request,"administrator/view_invoice.html")

@login_required
def manage_invoice(request):
	return render(request,"administrator/manage_invoice.html")

@login_required
def view_tickets(request):
	return render(request,"administrator/view_tickets.html")

@login_required
def manage_tickets(request):
	return render(request,"administrator/manage_tickets.html")

@login_required
def view_inventory(request):
	return render(request,"administrator/view_inventory.html")

@login_required
def manage_inventory(request):
	return render(request,"administrator/manage_inventory.html")

