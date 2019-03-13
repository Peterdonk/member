
# Import Starts

from django.contrib.auth import authenticate, login
from django.shortcuts import redirect, render

from client.views import login

from .forms import client_signup_form
from .models import ClientRegistrationmodel

# Import Ends


def index(request):
	return render(request,'client/landingPage.html')

def login(request):
	if request.method == 'POST':
		form = AuthenticationForm(request.POST)

		username = request.POST['username']
		password = request.POST['password']

		user = authenticate(username = username, password = password)

		if user is not None:
			if user.is_active:
				auth_login(request,user)
				return render('client/dashboard/')

		else:
			messages.error(request,'The Username Or Password Is Incorrect')
			return render('dashboard')

	else:
		form = AuthenticationForm()
		return redirec(request, 'dashboard', {'form': form})

	
def client_signup(request):
	args = {'form': client_signup_form}
	return render(request,'client/signup.html',args)


def dashboard(request):
	return render(request, 'client/dashboard.html')

def account_details(request):
	return render(request, 'client/account-details.html')

def payments(request):
	return render(request, 'client/payments.html')

def payment_invoice(request):
	return render(request, 'client/payment-invoice.html')

def service_status(request):
	return render(request, 'client/service-status.html')

def client_add(request):
	form = client_signup_form(request.POST)
	if form.is_valid():
		register_client = ClientRegistrationmodel(
			client_name = form.cleaned_data['client_name'],
			client_telephone = form.cleaned_data['client_telephone'],
			client_contact_person = form.cleaned_data['client_contact_person'],
			client_contact_telephone = form.cleaned_data['client_contact_telephone'],
			client_email = form.cleaned_data['client_email'],
			client_service = form.cleaned_data['client_service'],
			client_digital_address = form.cleaned_data['client_digital_address'],
			client_password = form.cleaned_data['client_password'])
		
		register_client.save()
		return redirect('dashboard')
	else:
		return redirect('login')

