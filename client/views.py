from django.contrib.auth import authenticate, login
from django.shortcuts import redirect, render
from django.contrib.auth.forms import UserCreationForm

from .forms import client_signup_form

from client.views import login


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
				return redirect('index')

		else:
			messages.error(request,'The Username Or Password Is Incorrect')
			return redirect('login')

	else:
		form = AuthenticationForm()
		return render(request, 'client/login.html', {'form': form})

	
def client_signup(request):
	if request.method == "POST":
		form = client_signup_form(request.POST)
		if form.is_valid():
			if form.save():
				username = form.cleaned_data.get('username')
				password = form.cleaned_data.get('password1')
				user = authenticate(username = username, password = password)
	else:
		form = client_signup_form()
		args = {'form':form}
		return render(request,'client/signup.html',args)

def client_dashboard(request):
	return render(request, 'registration/dashboard.html')
