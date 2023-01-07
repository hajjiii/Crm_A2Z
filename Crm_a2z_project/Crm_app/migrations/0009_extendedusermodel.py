# Generated by Django 4.1.4 on 2022-12-12 04:52

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Crm_app', '0008_remove_leads_city_delete_city'),
    ]

    operations = [
        migrations.CreateModel(
            name='ExtendedUserModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employe_name', models.CharField(max_length=25)),
                ('address', models.TextField()),
                ('dob', models.DateField()),
                ('blood_group', models.CharField(blank=True, max_length=5, null=True)),
                ('phn_number', models.CharField(max_length=15)),
                ('is_telecallers', models.CharField(blank=True, max_length=10, null=True)),
                ('is_staff', models.CharField(blank=True, max_length=10, null=True)),
                ('is_superviser', models.CharField(blank=True, max_length=10, null=True)),
                ('is_designer', models.CharField(blank=True, max_length=10, null=True)),
                ('is_dealer', models.CharField(blank=True, max_length=10, null=True)),
                ('is_technician', models.CharField(blank=True, max_length=10, null=True)),
                ('is_factory_superviser', models.CharField(blank=True, max_length=10, null=True)),
                ('user_photo', models.ImageField(blank=True, null=True, upload_to='pictures')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
