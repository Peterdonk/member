from django.db import models
from django.conf import settings
from django.contrib.auth import get_user_model

class ClientRegistrationForm(models.Model):
    client_name = models.CharField(max_length=50)
    client_telephone = models.CharField(max_length=15)
    client_contact_person = models.CharField(max_length=50, blank=True, null=True)
    client_contact_telephone = models.CharField(max_length=15, blank=True, null=True)
    client_service = models.ForeignKey('Services', models.DO_NOTHING, db_column='client_service')
    client_digital_address = models.CharField(max_length=20, blank=True, null=True)
    client_status = models.ForeignKey('AccountStatus', models.DO_NOTHING, db_column='client_status')
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    time_created = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'clientregistrationform'




class AccountDetailsInfo(models.Model):
    account_details_id = models.AutoField(primary_key=True)
    total_amount = models.CharField(max_length=200)
    amount_paid = models.CharField(max_length=200)
    remaining_balance = models.CharField(max_length=200)
    account_status = models.ForeignKey('AccountStatus', models.DO_NOTHING, db_column='account_status')
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    service_type = models.ForeignKey('Services', models.DO_NOTHING, db_column='service_type')
    job_description = models.TextField()

    class Meta:
        managed = True
        db_table = 'account_details'




class AccountInvoice(models.Model):
    account_invoice_id = models.AutoField(primary_key=True)
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    invoice_number = models.CharField(max_length=50)
    description = models.TextField()
    amount_charged = models.CharField(max_length=50)
    date_recorded = models.DateTimeField()                                 

    class Meta:
        managed = True
        db_table = 'account_invoice'




class AccountStatus(models.Model):
    account_status_id = models.AutoField(primary_key=True)
    account_status_name = models.CharField(max_length=50)

    class Meta:
        managed = True
        db_table = 'account_status'




class PaymentHistory(models.Model):
    payment_history_id = models.AutoField(primary_key=True)
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    amount_paid = models.CharField(max_length=50)
    payment_mode = models.ForeignKey('PaymentMode', models.DO_NOTHING, db_column='payment_mode')
    received_by = models.CharField(max_length=100)
    payment_date = models.DateTimeField()

    class Meta:
        managed = True
        db_table = 'payment_history'




class PaymentMode(models.Model):
    payment_mode_id = models.AutoField(primary_key=True)
    mode_name = models.CharField(max_length=50)

    class Meta:
        managed = True
        db_table = 'payment_mode'





class ServiceDetails(models.Model):
    service_details_id = models.AutoField(primary_key=True)
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    service_type = models.ForeignKey('Services', models.DO_NOTHING, db_column='service_type')
    service_progress = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'service_details'





class Services(models.Model):
    services_id = models.AutoField(primary_key=True)
    services_name = models.CharField(max_length=50)

    class Meta:
        managed = True
        db_table = 'services'



class TicketResponse(models.Model):
    ticket_response_id = models.AutoField(primary_key=True)
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    ticket_id = models.CharField(max_length=25)
    message = models.TextField()
    sent_from = models.IntegerField()
    date_sent = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'ticket_response'




class Tickets(models.Model):
    ticket_id = models.AutoField(primary_key=True)
    client_user = models.ForeignKey(settings.AUTH_USER_MODEL, models.DO_NOTHING)
    problem_ticket_id = models.CharField(max_length=25)
    problem_title = models.TextField()
    problem_description = models.TextField()
    problem_status = models.ForeignKey(AccountStatus, models.DO_NOTHING, db_column='problem_status')
    date_opened = models.DateTimeField(auto_now_add=True)
    date_closed = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'tickets'








