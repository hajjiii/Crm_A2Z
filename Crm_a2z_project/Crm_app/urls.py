
from django.urls import path
from Crm_app import views
from django.conf import settings
from django.urls import re_path
from django.views.static import serve




app_name= 'Crm_app'
urlpatterns = [
    path('',views.staff_login,name="staff_login"),
    path('**admin-register**/', views.admin_register, name='admin_register'),
    path('**staff-register**/',views.register,name="staff_register"),
    path('logout/',views.crm_logout,name="logout"),
    path('index',views.index,name='index'),
    path('leads-add',views.lead_add,name='addlead'),
    path('ajax/load-cities/', views.load_cities, name='ajax_load_cities'),
    path('lead-edit/<slug:slug>',views.lead_edit,name='editlead'),
    path('lead-view/<slug:slug>',views.lead_view,name='viewlead'),
    path('status-edit/<slug:slug>',views.status_edit,name='editstatus'),
    path('lead-delete/<slug:slug>',views.lead_delete,name='deletelead'),
    # ------------------openlead-------------------------------------------
    path('open-lead',views.open_leads,name='openlead'),
    path('open-lead-edit/<slug:slug>',views.open_lead_edit,name='editopenlead'),
    path('open-lead-status/<slug:slug>',views.open_lead_status,name='openleadstatus'),
    path('open-lead-delete/<slug:slug>',views.open_lead_delete,name='deleteopenlead'),

# ----------------------------------------------------------------------------------------

    path('running-lead',views.running_leads,name='runninglead'),
    path('running-lead-edit/<slug:slug>',views.running_lead_edit,name='edit_running_lead'),
    path('running-lead-status/<slug:slug>',views.running_lead_status,name='running_lead_status'),
    path('running-lead-delete/<slug:slug>',views.running_lead_delete,name='delete_running_lead'),
    path('closed-lead',views.closed_leads,name='closedlead'),
    path('closed-lead-edit/<slug:slug>',views.closed_lead_edit,name='edit_closed_lead'),
    path('closed-lead-delete/<slug:slug>',views.closed_lead_delete,name='delete_closed_lead'),

    # --------------------------------------------------------------------------------------------
    path('telecallers-details',views.telecaller,name='telecaller'),

    # --------------------------------------------------------------------------------------------
    path('add-client',views.client_add, name='client'),
    path('client-view/<slug:slug>',views.client_view,name='viewclient'),
    path('client-edit/<slug:slug>',views.client_edit,name='editclient'),
    path('client-delete/<slug:slug>',views.client_delete,name='deleteclient'),





    # -----------------------------------------------------------
    path('add-project',views.project_add, name='project'),
    path('project-assigned',views.assigned_poject, name='project_asigned'),

    path('project-view/<slug:slug>',views.project_view,name='viewproject'),
    path('project-edit/<slug:slug>',views.project_edit,name='editproject'),
    path('project-delete/<slug:slug>',views.project_delete,name='deleteproject'),
    re_path(r'^download/(?P<path>.*)$',serve,{'document_root':settings.MEDIA_ROOT}),
    path('teamleader_list',views.team_leader_details, name='listteamleader'),
    path('team-leader-view/<int:id>',views.team_leader_view,name='viewteamleader'),
    path('team-leader-edit/<int:id>',views.team_leader_edit,name='editteamleader'),
    path('teamleader-delete/<int:id>',views.teamleader_delete,name='deleteteamleader'),
    # ---------------------------------------------------------

    path('project-assignment-add/<slug:slug>',views.project_assignment_add,name='prjctassignmnt'),
    path('list-project-assignment',views.list_prjct_assgnmnt, name='projectassgnmnt'),
    path('project-assignmnet-edit/<int:id>',views.project_assignment_edit,name='editprjctassgnmnt'),
    path('prjct-assignmnt-delete/<int:id>',views.prjct_assgnmnt_delete,name='deleteprjctassgnmnt'),



# ---------------------------------------------------------------------------------------------------
    # path('module-assgnmnt-add/<int:id>',views.module_assgnmnt_add,name='add_module_assgnmnt'),
    path('project-module-add/<slug:slug>',views.project_module_add,name='prjctmodule'),
    path('project-module-delete/<int:id>',views.project_module_delete,name='deleteprjctmodule'),
    path('project-module-edit/<int:id>',views.project_module_edit,name='editprjctmodule'),
    path('project-module-view/<int:id>',views.project_module_view,name='viewprjctmodule'),
    path('module-mngmnt/<int:id>',views.module_management,name='modulemngmnt'),
    path('module-mngmnt-delete/<int:id>',views.module_management_delete,name='deletemodulemngmnt'),







# ------------------------------------------------------------------------------------------
    path('running-project',views.running_project, name='runningproject'),
    path('suspended-project',views.suspended_project, name='suspendedproject'),
    path('closed-project',views.closed_project, name='closedproject'),
    path('lead-project-delete/<slug:slug>',views.lead_project_delete,name='deleteprojectlead'),
    path('lead-project-edit/<slug:slug>',views.lead_project_edit,name='editprojectlead'),






] 













