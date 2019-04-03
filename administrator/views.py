from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

# Create your views here.

def register(request):
	if request.method == "POST":
		#Getting values from post
		get_admin_name = request.POST.get('admin_username')
		get_admin_email = request.POST.get('admin_email')
		get_admin_password = request.POST.get('admin_password')

		#saving the post
		admin_add = User.objects.create_user(username=get_admin_name,
	                email=get_admin_email,password=get_admin_password,is_superuser=1)
		if admin_add:
			return redirect('login')
	return render(request,'administrator/register.html')

@login_required
def admin_dashboard(request):
	return render(request,'administrator/index.html')
