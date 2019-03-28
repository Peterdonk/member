
# Import Starts

from django.contrib.auth import authenticate, login
from django.shortcuts import redirect, render
from django.contrib.auth.hashers import make_password,check_password

from client.views import login

from .forms import ClientSignupForm

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
        return redirect(request, 'dashboard', {'form': form})


def client_signup(request):
    if request.method == "POST":
        get_password = request.POST.get('client_password')
        harsed_password = make_password(get_password)
        updated_data = request.POST.copy()
        updated_data.update({'client_password':harsed_password})
        form = ClientSignupForm(data = updated_data)
        if form.is_valid():

            form.save()
            print("Saved Successfully")
            return redirect('login')
        else:
            print("Failed To Save")
            return  render(request,'client/signup',{'form':form})
    else:
        form = ClientSignupForm()
        return render(request,'client/signup.html',{'form':form})


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

def add_service(request):
    return render(request, 'client/add-service.html')

def service_tickets(request):
    return render(request, 'client/service-tickets.html')

def ticket_details(request):
    return render(request, 'client/ticket-details.html')


   



