# Generated by Django 4.1.4 on 2023-03-11 05:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0100_modulemanagement_developer'),
    ]

    operations = [
        migrations.AlterField(
            model_name='modulemanagement',
            name='project_assignment',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='prjctasgnmnt', to='Crm_app.projectassignment'),
        ),
    ]
