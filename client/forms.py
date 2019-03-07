from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class client_signup_form(UserCreationForm):
	organization_name = forms.CharField(max_length=50,required=False)
	individual_name = forms.CharField(max_length=50,required = False)
	telephone = forms.CharField(max_length=50,required = False)
	contact_person = forms.CharField(max_length=50,required = False)
	contact_telephone = forms.CharField(max_length=50,required = False)
	email = forms.CharField(max_length=50,required = False)
	service = forms.CharField(max_length=50,required = False)
	digital_address = forms.CharField(max_length=50,required = False)

	class Meta:
		model = User
		fields = ('username','organization_name','individual_name','telephone',
			'contact_person','contact_telephone','email','service','digital_address')

			

	
