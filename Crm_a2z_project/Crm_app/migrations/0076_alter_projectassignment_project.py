# Generated by Django 4.1.2 on 2023-02-15 06:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0075_remove_projectassignment_project_assignment_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='projectassignment',
            name='project',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='products', to='Crm_app.project'),
        ),
    ]
