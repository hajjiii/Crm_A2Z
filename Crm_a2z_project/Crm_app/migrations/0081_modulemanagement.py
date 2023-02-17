# Generated by Django 4.1.4 on 2023-02-17 04:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0080_projectassignment_project_start_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='ModuleManagement',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('module_management_key', models.CharField(blank=True, max_length=25, null=True)),
                ('module_name', models.CharField(blank=True, max_length=30, null=True)),
                ('module_description', models.TextField(blank=True, max_length=250, null=True)),
                ('module_start_date', models.DateField(blank=True, null=True)),
            ],
        ),
    ]
