# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-27 22:48
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('game', '0002_seedvectorparam_app'),
    ]

    operations = [
        migrations.AlterField(
            model_name='seedvectorparam',
            name='app',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='instance_vectorparams', to='game.ZeroPlayerGame'),
        ),
    ]
