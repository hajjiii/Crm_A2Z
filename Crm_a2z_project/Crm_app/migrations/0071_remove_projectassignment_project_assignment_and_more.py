# Generated by Django 4.1.2 on 2023-02-13 04:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0070_alter_leads_title_alter_project_project_title_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='projectassignment',
            name='project_assignment',
        ),
        migrations.AddField(
            model_name='projectassignment',
            name='project_assignment',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
    ]