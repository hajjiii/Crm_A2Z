# Generated by Django 4.1.4 on 2023-02-18 09:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0085_modulemanagement_prjct_assignment'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='modulemanagement',
            name='prjct_assignment',
        ),
        migrations.AlterField(
            model_name='modulemanagement',
            name='module_assigned',
            field=models.ManyToManyField(blank=True, null=True, related_name='module_assigned', to='Crm_app.extendedusermodel'),
        ),
    ]
