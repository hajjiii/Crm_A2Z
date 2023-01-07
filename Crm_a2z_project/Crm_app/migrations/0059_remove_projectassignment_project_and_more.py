# Generated by Django 4.1.2 on 2022-12-30 11:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0058_remove_projectassignment_project_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='projectassignment',
            name='project',
        ),
        migrations.AddField(
            model_name='projectassignment',
            name='project',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Crm_app.project'),
        ),
    ]
