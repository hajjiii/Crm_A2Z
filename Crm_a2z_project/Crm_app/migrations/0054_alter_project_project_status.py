# Generated by Django 4.1.2 on 2022-12-28 05:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0053_invoice_slug_alter_invoice_invoice_status_billing'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='project_status',
            field=models.ForeignKey(blank=True, default=1, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Crm_app.projectstatus'),
        ),
    ]
