from django.db import models

class ClientRegistrationmodel(models.Model):
    client_id = models.AutoField(primary_key=True)
    client_name = models.CharField(max_length=50)
    client_telephone = models.CharField(max_length=15)
    client_contact_person = models.CharField(max_length=50, blank=True, null=True)
    client_contact_telephone = models.CharField(max_length=15, blank=True, null=True)
    client_email = models.CharField(max_length=20)
    client_service = models.CharField(max_length=20)
    client_digital_address = models.CharField(max_length=20, blank=True, null=True)
    client_password = models.TextField()
    time_created = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'client_registrationmodel'

