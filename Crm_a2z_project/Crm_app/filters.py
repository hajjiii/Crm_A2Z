import django_filters
from .models import *



class LeadsFilter(django_filters.FilterSet):
    class Meta:
        model = Leads
        fields = ['title','contact_person','contact_person_number']



class ClientFilter(django_filters.FilterSet):
    class Meta:
        model =  Client
        fields = ['contact_person_name','business_name']


class ProjectFilter(django_filters.FilterSet):
    class Meta:
        model = Project
        fields = ['client','project_title','category']
