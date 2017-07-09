from django.conf.urls import url, include
from . import views
# from django.contrib import admin

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^surveyProcess$', views.surveyProcess, name='surveyProcess'),
    url(r'^surveyDone$', views.surveyDone, name='surveyDone'),
    url(r'^index$', views.index, name='index'),
]
