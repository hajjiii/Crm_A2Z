# Generated by Django 4.1.4 on 2023-02-21 07:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Crm_app', '0090_projectmodule'),
    ]

    operations = [
        migrations.AlterField(
            model_name='projectmodule',
            name='created_by',
            field=models.CharField(blank=True, max_length=25, null=True),
        ),
    ]
