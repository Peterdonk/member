from django.db import models
from django.conf import settings
from django.contrib.auth import get_user_model

class Clientregistrationform(models.Model):
    client_id = models.AutoField(primary_key=True)
    client_name = models.CharField(max_length=50)
    client_telephone = models.CharField(max_length=15)
    client_contact_person = models.CharField(max_length=50, blank=True, null=True)
    client_contact_telephone = models.CharField(max_length=15, blank=True, null=True)
    client_service = models.CharField(max_length=20)
    client_digital_address = models.CharField(max_length=20, blank=True, null=True)
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    time_created = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'clientregistrationform'

