# Generated by Django 4.1.4 on 2023-03-02 10:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0094_modulemanagement_developer_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='modulemanagement',
            name='developer_id',
        ),
    ]