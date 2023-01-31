from django.urls import path
from . import views


urlpatterns = [
    path('',views.marketing,name='marketing'),
    path('marketing-view/<int:vid>',views.marketing_view,name='view'),
    path('delete/<int:did>',views.marketing_delete,name='delete'),
    path('marketing-edit/<int:eid>',views.marketing_edit,name='edit'),
    path('contact-client',views.contact_client,name='contact_client'),
    path('contact-client1',views.contact_client1,name='contact_clientt'),



]