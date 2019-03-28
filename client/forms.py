from django.forms import ModelForm
from django import forms
from .models import Clientregistrationform

class ClientSignupForm(ModelForm):

	class Meta:
		model = Clientregistrationform
		fields = '__all__'



