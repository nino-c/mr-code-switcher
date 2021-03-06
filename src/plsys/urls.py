from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.sitemaps.views import sitemap
import profiles.urls
import accounts.urls
import portfolio.urls
import deployments.urls
import game.urls
import symbolic_math.urls
from . import views
from game.views import *


#root = views.blankhome if DEPLOYMENT_LEVEL == 'local' \
#    else views.plerpingapp

#root = views.plerpingapp

urlpatterns = [
    url(r'^$', game.views.gameindex, name='home'),
    url(r'^game/', include(game.urls, namespace='game')),
    url(r'^github/', views.github, name='github'),
    url(r'^about/', views.AboutPage.as_view(), name='about'),
    url(r'^users/', include(profiles.urls, namespace='profiles')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^portfolio/', include(portfolio.urls, namespace='portfolio')),
    url(r'^deployments/', include(deployments.urls, namespace='deployments')),
    url(r'^symbolic_math/', include(symbolic_math.urls, namespace='symbolic_math')),
    url(r'^templatetest/(?P<template>[a-zA-Z0-9\-\_]+)$', views.templatetest),
    url(r'^accounts/', include(accounts.urls, namespace='accounts')),
    #url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
    #url(r'^sitemap-(?P<section>.+)\.xml$', views.sitemap, {'sitemaps': sitemaps}),
]

# User-uploaded files like profile pics need to be served in development
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
