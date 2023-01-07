from django.contrib import admin
from .models import Invoice, InvoiceStatus, LeadCategory, State, District,  Leads, LeadSource,ExtendedUserModel , LeadType, LeadStatus, Client, Project, ClientStatus, ProjectStatus,ProjectAssignment
# Register your models here.
admin.site.register(LeadCategory)
admin.site.register(State)
admin.site.register(District)
admin.site.register(LeadStatus)
admin.site.register(Leads)
admin.site.register(LeadSource)
admin.site.register(ExtendedUserModel)
admin.site.register(LeadType)
admin.site.register(Client)
admin.site.register(Project)
admin.site.register(ClientStatus)
admin.site.register(ProjectStatus)
admin.site.register(Invoice)
admin.site.register(InvoiceStatus)
admin.site.register(ProjectAssignment)










