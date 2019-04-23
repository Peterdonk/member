
# Import Starts

from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render
from django.contrib.auth.hashers import make_password,check_password
from django.contrib.auth.models import User
from django.contrib import messages
from django.views import View
from .models import *
from django.http import JsonResponse
from datetime import datetime, date, time, timedelta


from client.views import login
from .forms import ClientSignupForm

# Import Ends

class IndexView(View):
    template_name = 'client/landingPage.html'
    def get(self,request):
        return render(request,self.template_name);

class LoginView(View):
    template_name = 'client/login.html'
    def post(self,request):
        form = AuthenticationForm(request.POST)

        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(username = username, password = password)

        if user is not None:
            if user.is_active:
                auth_login(request,user)
                return redirect('client/dashboard/')
        else:
            print('Something is wrong')
            form = AuthenticationForm()
            return render(request,self.template_name,{'form':form})

    def get(self,request):
        return render(request,self.template_name)     
       
@login_required
def logged_in(request):
    if request.user.is_superuser:
        # user is an admin
        return redirect("/administrator/dashboard")
    else:
        return redirect('/client/dashboard')




class SignupView(View):
        services = Services.objects.all()
        def post(self,request):
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

            # check if user is already in database

            if User.objects.filter(username=get_raw_username,email=get_raw_email).exists():
                messages.error(request, 'Username Or Email Already Exists in the database.')
                context = {'services':self.services}
                return render(request,'client/signup.html',context)
            else:
                #Insert into users table
                user = User.objects.create_user(username=get_raw_username,
                        email=get_raw_email,password=get_raw_password)

                # Getting Just Inserted user ID
                user_id = user.id

                #Create a new instance of the ClientSignupForm
                updated_data = request.POST.copy()
                updated_data.update({'client_user':user_id})
                updated_data.update({'client_status':'1'})

                form = ClientSignupForm(data = updated_data)

                if form.is_valid():
                    form.save()

                    #creating an instance of the Auth user and Services and Account Status
                    get_user_id = User.objects.get(id=user_id)
                    service_type = Services.objects.get(services_id = get_raw_client_service)
                    account_status = AccountStatus.objects.get(account_status_id = '1') 

                    #adding to Service Details
                    add_service_detail = ServiceDetails(client_user = get_user_id,service_type=service_type,service_progress='0')
                    add_service_detail.save()

                    #adding to Account Details
                    add_account_details = AccountDetailsInfo(client_user = get_user_id, service_type = service_type,account_status = account_status,total_amount='0',amount_paid='0',remaining_balance='0')
                    add_account_details.save()

                    return redirect("/client/login/")
                else:
                    print("Unable to save")
                    form = ClientSignupForm()
                    context = {'form':form,'services':self.services}
                    return render(request,'client/signup.html',context)

        def get(self,request):
            context = {'services':self.services}
            return render(request,'client/signup.html',context)



def dashboard(request):
    return render(request, 'client/dashboard.html')

class AccountDetails(View):
    def post(self,request):
        user_id = request.user
        current_user_id = user_id.id

        get_raw_id = request.POST.get('client_u_id')

        get_raw_name = request.POST.get('client_name')
        get_raw_telephone = request.POST.get('client_telephone')
        get_raw_email = request.POST.get('email')
        get_raw_contact_person = request.POST.get('client_contact_person')
        get_raw_contact_telephone = request.POST.get('client_contact_telephone')
        get_raw_digital_address = request.POST.get('client_digital_address')

        if int(get_raw_id) == current_user_id:
             if request.is_ajax():
                ClientRegistrationForm.objects.filter(client_user = current_user_id).update(client_name = get_raw_name,
                    client_telephone = get_raw_telephone,
                    client_digital_address = get_raw_digital_address,
                    client_contact_person = get_raw_contact_person,
                    client_contact_telephone = get_raw_contact_telephone)
                User.objects.filter(id = current_user_id).update(email = get_raw_email)

                data = {
                'message':True,
                }
                return JsonResponse(data)
        else:
            return redirect('/client/login/')

       

    def get(self,request):
        user_id = request.user
        current_user_id = user_id.id
        try:
            initital_registration_info = User.objects.get(id = current_user_id)
            registrationInformation = ClientRegistrationForm.objects.get(client_user = current_user_id)
        except ClientRegistrationForm.DoesNotExist:
            registrationInformation = None
            initital_registration_info = None
        
        context = {'registrationInformation':registrationInformation,'initital_registration_info':initital_registration_info}
        return render(request, 'client/account-details.html',context)



class Payments(View):
    def get(self,request):
        user_id = request.user
        current_user_id = user_id.id

        user_info = User.objects.get(id = current_user_id)
        account_info = AccountDetailsInfo.objects.get(client_user = current_user_id)
        payment_history = PaymentHistory.objects.filter(client_user = current_user_id)

        today = user_info.date_joined
        due_date_two_weeks = today + timedelta(days=-today.weekday(), weeks=2)

        initial_deposit = round((float(0.3) * float(account_info.total_amount)),2) 


        context = {'account_info':account_info,
                'user_info':user_info,
                'due_date':due_date_two_weeks,
                'initial_deposit':initial_deposit,
                'payment_history':payment_history
        }

        return render(request, 'client/payments.html',context)
    

def payment_invoice(request):
    return render(request, 'client/payment-invoice.html')

class ServiceStatus(View):
    def get(self,request):
        user_id = request.user
        current_user_id = user_id.id

        user_info = User.objects.get(id = current_user_id)
        account_info = AccountDetailsInfo.objects.get(client_user = current_user_id)
        service_status = ServiceDetails.objects.get(client_user = current_user_id)

        user_info
        context = {'account_info':account_info,
                'user_info':user_info,
                'service_status':service_status
        }

        return render(request, 'client/service-status.html',context)

def add_service(request):
    return render(request, 'client/add-service.html')

class ServiceTickets(View):
    def post(self,request):
        user_id = request.user
        current_user_id = user_id.id

        get_raw_id = request.POST.get('client_u_id')

        get_ticketID = request.POST.get('txt_ticketID')
        get_problemTitle = request.POST.get('txt_problemTitle')
        get_problemDescription = request.POST.get('txt_problemDesc')

         #creating an instance of the Auth user and Services and Account Status
        get_user_id = User.objects.get(id=current_user_id)
        ticket_status = AccountStatus.objects.get(account_status_id = '1') 

        if int(get_raw_id) == current_user_id:
             if request.is_ajax():
                add_ticket = Tickets(client_user = get_user_id, problem_ticket_id=get_ticketID, problem_title=get_problemTitle,problem_description = get_problemDescription,problem_status = ticket_status)
                add_ticket.save()   
                data = {
                'message':True,
                }
                return JsonResponse(data)
        else:
            return redirect('/client/login/')

    def get(self,request):
        return render(request,'client/service-tickets.html')
        

def ticket_details(request):
    return render(request, 'client/ticket-details.html')


   



