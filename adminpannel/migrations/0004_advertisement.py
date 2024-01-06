# Generated by Django 3.2 on 2023-08-19 13:34

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('adminpannel', '0003_feedback'),
    ]

    operations = [
        migrations.CreateModel(
            name='Advertisement',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_caption', models.CharField(max_length=100)),
                ('date', models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True)),
                ('adv_id', models.IntegerField()),
                ('second_caption', models.CharField(max_length=100)),
                ('third_caption', models.CharField(max_length=100)),
                ('fourth_caption', models.CharField(max_length=100)),
                ('fifth_caption', models.CharField(max_length=100)),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to='static/images/billboards&others/')),
                ('category', models.ManyToManyField(to='adminpannel.Categories', verbose_name='category')),
                ('sub_category', models.ManyToManyField(to='adminpannel.Subcategories', verbose_name='category')),
            ],
            options={
                'verbose_name_plural': 'Advertisements',
                'db_table': 'advertisement',
            },
        ),
    ]
