# Generated by Django 3.2 on 2023-07-10 13:11

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('adminpannel', '0002_customers'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product', models.CharField(max_length=50)),
                ('size', models.CharField(max_length=50)),
                ('quantity', models.IntegerField()),
                ('price', models.DecimalField(decimal_places=2, max_digits=9)),
                ('product_id', models.IntegerField()),
                ('issue_date', models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True)),
                ('customer_data', models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='adminpannel.customers')),
            ],
            options={
                'verbose_name_plural': 'Order',
                'db_table': 'order',
            },
        ),
    ]
