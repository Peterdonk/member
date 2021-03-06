# Generated by Django 2.1.7 on 2019-04-22 10:02

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='AccountDetails',
            fields=[
                ('account_details_id', models.AutoField(primary_key=True, serialize=False)),
                ('total_amount', models.CharField(max_length=200)),
                ('amount_paid', models.CharField(max_length=200)),
                ('remaining_balance', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'account_details',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='AccountInvoice',
            fields=[
                ('account_invoice_id', models.AutoField(primary_key=True, serialize=False)),
                ('invoice_number', models.CharField(max_length=50)),
                ('description', models.TextField()),
                ('amount_charged', models.CharField(max_length=50)),
                ('date_recorded', models.DateTimeField()),
                ('client_user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'account_invoice',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='AccountStatus',
            fields=[
                ('account_status_id', models.AutoField(primary_key=True, serialize=False)),
                ('account_status_name', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'account_status',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='ClientRegistrationForm',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('client_name', models.CharField(max_length=50)),
                ('client_telephone', models.CharField(max_length=15)),
                ('client_contact_person', models.CharField(blank=True, max_length=50, null=True)),
                ('client_contact_telephone', models.CharField(blank=True, max_length=15, null=True)),
                ('client_digital_address', models.CharField(blank=True, max_length=20, null=True)),
                ('time_created', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'clientregistrationform',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='PaymentHistory',
            fields=[
                ('payment_history_id', models.AutoField(primary_key=True, serialize=False)),
                ('amount_paid', models.CharField(max_length=50)),
                ('received_by', models.CharField(max_length=100)),
                ('payment_date', models.DateTimeField()),
                ('client_user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'payment_history',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='PaymentMode',
            fields=[
                ('payment_mode_id', models.AutoField(primary_key=True, serialize=False)),
                ('mode_name', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'payment_mode',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='ServiceDetails',
            fields=[
                ('service_details_id', models.AutoField(primary_key=True, serialize=False)),
                ('service_progress', models.IntegerField()),
                ('client_user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'service_details',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Services',
            fields=[
                ('services_id', models.AutoField(primary_key=True, serialize=False)),
                ('services_name', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'services',
                'managed': True,
            },
        ),
        migrations.AddField(
            model_name='servicedetails',
            name='service_type',
            field=models.ForeignKey(db_column='service_type', on_delete=django.db.models.deletion.DO_NOTHING, to='client.Services'),
        ),
        migrations.AddField(
            model_name='paymenthistory',
            name='payment_mode',
            field=models.ForeignKey(db_column='payment_mode', on_delete=django.db.models.deletion.DO_NOTHING, to='client.PaymentMode'),
        ),
        migrations.AddField(
            model_name='clientregistrationform',
            name='client_service',
            field=models.ForeignKey(db_column='client_service', on_delete=django.db.models.deletion.DO_NOTHING, to='client.Services'),
        ),
        migrations.AddField(
            model_name='clientregistrationform',
            name='client_status',
            field=models.ForeignKey(db_column='client_status', on_delete=django.db.models.deletion.DO_NOTHING, to='client.AccountStatus'),
        ),
        migrations.AddField(
            model_name='clientregistrationform',
            name='client_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='accountdetails',
            name='account_status',
            field=models.ForeignKey(db_column='account_status', on_delete=django.db.models.deletion.DO_NOTHING, to='client.AccountStatus'),
        ),
        migrations.AddField(
            model_name='accountdetails',
            name='client_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='accountdetails',
            name='service_type',
            field=models.ForeignKey(db_column='service_type', on_delete=django.db.models.deletion.DO_NOTHING, to='client.Services'),
        ),
    ]
