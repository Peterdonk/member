
# Import Starts

from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render
from django.contrib.auth.hashers import make_password,check_password
from django.contrib.auth.models import User
from django.contrib import messages


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
                print("User Found")
                return render('client/dashboard/')
        else:
            form = AuthenticationForm()
            return render(request,'client/login.html',{'form':form})
    else:
        form = AuthenticationForm()
        return render(request,'client/login.html',{'form':form})

@login_required
def logged_in(request):
    if request.user.is_superuser:
        # user is an admin
        return redirect("admin_dashboard")
        print("This is admin")
    else:
        return redirect('/client/dashboard')




def client_signup(request):
    if request.method == "POST":
        #Getting Values From Post Request
        get_raw_username = request.POST.get("client_username")
        get_raw_password = request.POST.get("client_password")
        get_raw_email = request.POST.get("client_email")

        get_raw_client_name = request.POST.get("client_name")
        get_raw_client_telephone = request.POST.get("client_telephone")
        get_raw_client_contact_person = request.POST.get("client_contact_person")
        get_raw_client_contact_telephone = request.POST.get("client_contact_telephone")
        get_raw_client_service = request.POST.get("client_service")
        get_raw_client_digital_address = request.POST.get("client_digital_address")

        #Insert into users table
        user = User.objects.create_user(username=get_raw_username,
                email=get_raw_email,password=get_raw_password)

        # Getting Just Inserted user ID
        user_id = user.id

        #Create a new instance of the ClientSignupForm
        updated_data = request.POST.copy()
        updated_data.update(
            {'client_user':user_id}
            )

        form = ClientSignupForm(data = updated_data)

        if form.is_valid():
            form.save()
        else:
            print("Unable to save")

        return render(request,'client/signup.html')
    else:

        return render(request,'client/signup.html')



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


   



