from django import forms

class client_signup_form(forms.Form):
	client_name = forms.CharField(max_length=50,required=True)
	client_telephone = forms.CharField(max_length=50,required = False)
	client_contact_person = forms.CharField(max_length=50,required = False)
	client_contact_telephone = forms.CharField(max_length=50,required = False)
	client_email = forms.CharField(max_length=50,required = True)
	client_service = forms.CharField(max_length=50,required = False)
	client_digital_address = forms.CharField(max_length=50,required = False)
	client_password = forms.CharField(max_length=50,required = True)

	
