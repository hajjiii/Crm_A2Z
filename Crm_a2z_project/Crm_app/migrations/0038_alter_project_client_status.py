# Generated by Django 4.1.2 on 2022-12-20 05:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0037_rename_client_statue_project_client_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='client_status',
            field=models.ForeignKey(blank=True, default=2, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Crm_app.clientstatus'),
        ),
    ]
