# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-27 00:17
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django_thumbs.db.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=1000)),
                ('description', models.TextField(blank=True, null=True)),
                ('image', django_thumbs.db.models.ImageWithThumbsField(blank=True, null=True, upload_to=b'')),
                ('enabled', models.BooleanField(default=True)),
                ('popularity', models.IntegerField(default=1)),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='game.Category')),
            ],
        ),
        migrations.CreateModel(
            name='CodeModule',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('title', models.CharField(blank=True, max_length=255, null=True)),
                ('language', models.CharField(choices=[('javascript', 'text/javascript'), ('coffeescript', 'text/coffeescript'), ('paperscript', 'text/paperscript')], default='javascript', max_length=20)),
                ('source', models.TextField()),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='GameInstance',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('seed', models.TextField()),
                ('popularity', models.IntegerField(default=1)),
                ('vector', models.CharField(max_length=5000, null=True, unique=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='GameInstanceSnapshot',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('image', django_thumbs.db.models.ImageWithThumbsField(upload_to=b'')),
                ('time', models.FloatField(default=0)),
                ('instance', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='images', to='game.GameInstance')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='JSLibrary',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('scriptPath', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name_plural': 'JS libraries',
            },
        ),
        migrations.CreateModel(
            name='SavedFunction',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('title', models.CharField(blank=True, max_length=255, null=True)),
                ('language', models.CharField(choices=[('javascript', 'text/javascript'), ('coffeescript', 'text/coffeescript'), ('paperscript', 'text/paperscript')], default='javascript', max_length=20)),
                ('source', models.TextField()),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='savedFunctions', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='SeedVectorParam',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key', models.CharField(max_length=255)),
                ('val', models.CharField(blank=True, default='', max_length=5000, null=True)),
                ('int_val', models.IntegerField(blank=True, null=True)),
                ('valtype', models.CharField(default='string', max_length=25)),
                ('jsonval', models.TextField(default='')),
                ('ordering', models.IntegerField(default=0)),
                ('instance', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='vectorparams', to='game.GameInstance')),
            ],
            options={
                'ordering': ('ordering',),
            },
        ),
        migrations.CreateModel(
            name='ZeroPlayerGame',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('title', models.CharField(max_length=500)),
                ('description', models.TextField(blank=True)),
                ('scriptType', models.CharField(max_length=100, null=True)),
                ('source', models.TextField(blank=True)),
                ('seedStructure', models.TextField(blank=True)),
                ('mainImage', models.CharField(blank=True, max_length=255, null=True)),
                ('popularity', models.IntegerField(default=1)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='apps', to='game.Category')),
                ('extraIncludes', models.ManyToManyField(blank=True, null=True, to='game.JSLibrary')),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='game.ZeroPlayerGame')),
                ('required_modules', models.ManyToManyField(blank=True, null=True, to='game.CodeModule')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='gameinstance',
            name='game',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='instances', to='game.ZeroPlayerGame'),
        ),
        migrations.AddField(
            model_name='gameinstance',
            name='instantiator',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
