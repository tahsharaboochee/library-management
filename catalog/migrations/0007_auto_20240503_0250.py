# Generated by Django 3.0.5 on 2024-05-03 02:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0006_auto_20240503_0244'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userbook',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]
