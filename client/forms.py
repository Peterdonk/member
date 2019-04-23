from django.forms import ModelForm
from django import forms
from .models import ClientRegistrationForm

class ClientSignupForm(ModelForm):

	class Meta:
		model = ClientRegistrationForm
		fields = '__all__'



