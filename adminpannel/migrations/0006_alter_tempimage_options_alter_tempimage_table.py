# Generated by Django 4.2.3 on 2023-08-24 08:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('adminpannel', '0005_tempimage'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='tempimage',
            options={'verbose_name_plural': 'Tempimage'},
        ),
        migrations.AlterModelTable(
            name='tempimage',
            table='tempimage',
        ),
    ]
