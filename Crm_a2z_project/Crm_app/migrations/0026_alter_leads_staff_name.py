# Generated by Django 4.1.4 on 2022-12-15 10:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0025_alter_leads_staff_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='leads',
            name='staff_name',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Crm_app.extendedusermodel'),
        ),
    ]
