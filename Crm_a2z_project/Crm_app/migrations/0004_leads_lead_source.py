# Generated by Django 4.1.4 on 2022-12-09 09:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0003_leadsource'),
    ]

    operations = [
        migrations.AddField(
            model_name='leads',
            name='lead_source',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Crm_app.leadsource'),
        ),
    ]
