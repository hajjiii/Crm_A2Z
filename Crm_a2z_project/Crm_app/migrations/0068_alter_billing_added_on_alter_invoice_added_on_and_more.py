# Generated by Django 4.1.2 on 2023-02-03 06:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0067_alter_projectassignment_project_assignment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='billing',
            name='added_on',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='invoice',
            name='added_on',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='leads',
            name='actual_date_added_on',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='project',
            name='actual_date_added_on',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='projectassignment',
            name='added_on',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
