# Generated by Django 4.1.4 on 2023-02-16 10:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0078_remove_projectassignment_project_assignment_and_more'),
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
