import os
from django.http import Http404, HttpResponse
from django.contrib.auth.models import User,auth
from django.contrib.auth import authenticate , login 
from django.shortcuts import redirect, render
from .models import Client, LeadCategory, ModuleManagement, Project, ProjectAssignment, ProjectModule, State, District,  Leads, LeadSource,ExtendedUserModel , LeadType, LeadStatus 
from .forms import ClientViewForm, LeadAddForm, LeadEditForm, LeadViewForm, LoginForm, ModuleManagementForm,  ProjectAssignmentForm, ProjectAssignmnetProjectForm, ProjectModuleForm , StatusEditForm, ClientAddForm, ProjectAddForm, TeamleaderEditForm, TeamleaderViewForm
from email.message import EmailMessage
from django.http.response import JsonResponse
from django.contrib.auth import logout
from django.contrib import messages
from hashlib import blake2b
import time
from django.views.generic import UpdateView
from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from django.forms.models import modelformset_factory
from django.db.models import Count
from django.db.models import F
from django.http import HttpResponseRedirect
from django.core.mail import  EmailMessage
from django.conf import settings
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from django.db import transaction, IntegrityError
from cryptography.fernet import Fernet
from django.contrib.auth.decorators import login_required
import datetime
from .filters import ClientFilter, LeadsFilter, ProjectFilter


# Create your views here.
@login_required
def index(request):
    total_leads_count = Leads.objects.exclude(lead_statuss__name='ConvertToProject').count()
    today_leads_count = Leads.objects.filter(actual_date_added_on__contains=datetime.datetime.today().date()).count()
    total_closed_count = Leads.objects.filter(lead_statuss__name='ClosedLead').count()
    today_closed_leads_count = Leads.objects.filter(lead_statuss__name='ClosedLead',actual_date_added_on__contains=datetime.datetime.today().date()).count()

    context = {
        'total_leads_count':total_leads_count,
        'today_leads_count':today_leads_count,
        'total_closed_count':total_closed_count,
        'today_closed_leads_count':today_closed_leads_count
 
    }
    return render(request,'index.html',context)


@login_required
def lead_add(request):
    k = str(time.time()).encode('utf-8')
    h = blake2b(key=k, digest_size=10)
    key = h.hexdigest()

    
    # qs = Leads.objects.all()
    # for i in qs:
    #     id = i.id
    #     print('ID:',id)
    form = LeadAddForm()
    if request.method == 'POST':
        form = LeadAddForm(request.POST)
        if form.is_valid():
            data = form.save(commit=False)
            staff_name = User.objects.get(username=request.user.username)
            data.key = key
            data.staff_name = staff_name
            data.save()
            # form.save()
            return redirect('Crm_app:addlead')
    else:
        form = LeadAddForm()
    
    all_leads = Leads.objects.filter(lead_statuss__name='Freshlead').order_by("-id")
    filters = LeadsFilter(request.GET,queryset=all_leads)
    
    context = {
        "all_leads":all_leads,
        'form':form,
        'filters':filters
        }
    return render(request,'leads.html',context)
            
@login_required
def load_cities(request):
    state_id = request.GET.get('state_id')
    districts = District.objects.filter(state_id=state_id).all()
    return render(request, 'city_dropdown_list_options.html', {'districts': districts})

@login_required
def lead_edit(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:addlead')
    else:
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(instance=qs)
    return render(request,'lead_edit.html',{'form':form})

@login_required
def lead_view(request,slug):
    qs = Leads.objects.get(slug=slug)
    form = LeadViewForm(instance=qs)
    context = {'form':form}
    return render(request,'lead_view.html',context)

@login_required
def lead_delete(request,slug):
    qs = Leads.objects.filter(slug=slug)
    qs.delete()
    return redirect('Crm_app:addlead')

@login_required
def status_edit(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = StatusEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            print('hhbhbh')
            return redirect('Crm_app:addlead')
    else:
        qs = Leads.objects.get(slug=slug)
        form = StatusEditForm(instance=qs)
    return render(request,'status_edit.html',{'form':form})


@login_required
def open_leads(request):
    open_leadss = Leads.objects.filter(lead_statuss__name='Openlead').order_by('-id')
    filters = LeadsFilter(request.GET,queryset=open_leadss)
    context = {
        'open_leadss':open_leadss,
        'filters':filters
    }
    return render(request, 'open-lead.html', context)


@login_required
def open_lead_edit(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:openlead')
    else:
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(instance=qs)
    return render(request,'open_lead_edit.html',{'form':form})


@login_required
def open_lead_status(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = StatusEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            print('hhbhbh')
            return redirect('Crm_app:openlead')
    else:
        qs = Leads.objects.get(slug=slug)
        form = StatusEditForm(instance=qs)
    return render(request,'open-lead-status.html',{'form':form})


@login_required
def open_lead_delete(request,slug):
    qs = Leads.objects.filter(slug=slug)
    qs.delete()
    return redirect('Crm_app:openlead')


@login_required    
def running_leads(request):
    running_lead = Leads.objects.filter(lead_statuss__name='Runninglead').order_by('-id')
    filters = LeadsFilter(request.GET,queryset=running_lead)
    context = {
        'running_lead':running_lead,
        'filters':filters,
    }
    return render(request, 'running-lead.html', context)


@login_required
def running_lead_edit(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:runninglead')
    else:
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(instance=qs)
    return render(request,'running_lead_edit.html',{'form':form})


@login_required
def running_lead_status(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = StatusEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            print('hhbhbh')
            return redirect('Crm_app:runninglead')
    else:
        qs = Leads.objects.get(slug=slug)
        form = StatusEditForm(instance=qs)
    return render(request,'running-lead-status.html',{'form':form})


@login_required
def running_lead_delete(request,slug):
    qs = Leads.objects.filter(slug=slug)
    qs.delete()
    return redirect('Crm_app:runninglead')



@login_required    
def closed_leads(request):
    closed_lead = Leads.objects.filter(lead_statuss__name='ClosedLead').order_by('-id')
    filters = LeadsFilter(request.GET,queryset=closed_lead)

    context = {
        'closed_lead':closed_lead,
        'filters':filters
    }
    return render(request, 'closed-lead.html', context)


@login_required
def closed_lead_edit(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:closedlead')
    else:
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(instance=qs)
    return render(request,'closed_edit.html',{'form':form})


@login_required
def closed_lead_delete(request,slug):
    qs = Leads.objects.filter(slug=slug)
    qs.delete()
    return redirect('Crm_app:closedlead')



@login_required
def telecaller(request):
    staff = ExtendedUserModel.objects.filter(is_telecallers='on')
    t = Leads.objects.all()
    for i in t:
        k = i.staff
        print('TC:',k)
    details =[ ]
    d = [ ]
    open =[ ]
    leads_count = Leads.objects.filter(staff_name__username__in=ExtendedUserModel.objects.filter(is_telecallers='on'))
    print(leads_count)
    for i in staff:
        # print(i.user.username)
        # fcount = []
        # leads = Leads.objects.filter(staff_name__username =i.user.username).count()
        
        count = Leads.objects.filter(lead_statuss__name='Freshlead',staff_name__username = i.user.username).count()
        openleads = Leads.objects.filter(lead_statuss__name='Openlead',staff_name__username = i.user.username).count()
        viewdetails = Leads.objects.filter(staff_name__username = i.user.username)
        details.append(viewdetails)
        d.append(count)
        open.append(openleads)

        # fcount.append(count)
        # print('name:',leads)
        # print('count:',count)
        # print('openleadcount:',openleads)
    # for i in d:
    #     s = i
    #     request.session['s'] = s
    # print('value:',request.session['s'])
    print(d)
    context ={
    'staff':staff,
    'd':d,
    'open':open,
    'details':details
    }
    

    
    return render(request,'telecallers.html',context)




@login_required
def client_add(request):


    k = str(time.time()).encode('utf-8')
    h = blake2b(key=k, digest_size=10)
    key = h.hexdigest()
    form = ClientAddForm()
    if request.method == 'POST':
        form = ClientAddForm(request.POST)
        if form.is_valid():
            data = form.save(commit=False)
            data.c_key = key
            data.save()
            return redirect('Crm_app:client')
    else:
        form = ClientAddForm()
    all_client = Client.objects.filter(project_count__gte = 1)
    print(all_client)
    filters = ClientFilter(request.GET,queryset=all_client)
    context = {
        "all_client":all_client,
        'form':form,
        'filters':filters
        
        }
    return render(request,'client.html',context)




@login_required
def client_view(request,slug):
    qs = Client.objects.get(slug=slug)
    form = ClientViewForm(instance=qs)
    context = {'form':form}
    return render(request,'client_view.html',context)


@login_required
def client_delete(request,slug):
    qs = Client.objects.filter(slug=slug)
    qs.delete()
    return redirect('Crm_app:client')


@login_required
def client_edit(request,slug):
    if request.method == 'POST':
        qs = Client.objects.get(slug=slug)
        form = ClientViewForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:client')
    else:
        qs = Client.objects.get(slug=slug)
        form = ClientViewForm(instance=qs)
    return render(request,'client_edit.html',{'form':form})
        
from django.db.models import Q

@login_required
def project_add(request):   
    
    user_modules = []
    k = str(time.time()).encode('utf-8')
    h = blake2b(key=k, digest_size=10)
    key = h.hexdigest()
    form = ProjectAddForm()
    if request.method == 'POST':
        client = request.POST.get("client")
        print(client)
        clientcount = Client.objects.filter(c_key=client)
        for i in clientcount:
            i.project_count = i.project_count+1
            i.save()
            print(i.project_count)
        client= Client.objects.get(c_key=client)
        form = ProjectAddForm(request.POST)
        print(request.POST)
        if form.is_valid():
            
            data = form.save(commit=False)
            data.p_key = key
            data.client = client
            # print(data.client)

            data.save()
            print('form submitted')

            return redirect('Crm_app:project')
    else:
        form = ProjectAddForm()

    clients = Client.objects.all()
    if request.user.is_superuser:
        obj1 = Leads.objects.filter(lead_statuss__name = 'ConvertToProject')   
        filters1 = LeadsFilter(request.GET,queryset=obj1)  
        all_project = Project.objects.all().order_by('client__contact_person_name')
        filters = ProjectFilter(request.GET,queryset=all_project)
        return render(request,'project.html',{'all_project':all_project,'form':form,'clients':clients,'obj1':obj1,'filters':filters,'filters1':filters1})

    elif request.user.extendedusermodel.is_teammember:
        user = request.user.extendedusermodel.employe_name
        obj1 = Leads.objects.filter(lead_statuss__name = 'ConvertToProject') 
        filters1 = LeadsFilter(request.GET,queryset=obj1) 
        all_project = ProjectAssignment.objects.filter(project_assignment__user__username=request.user.username)
        print(all_project)
        all_module = ModuleManagement.objects.filter(developer__user__username=request.user.username,project_assignment__project_assignment__user__username=request.user.username)
        print(all_module)
      
       
   
            # for pr in i.project.projectmodule.all():
            #     print('asigned',pr)
            #     for module in pr.module.all():
            #         user_modules.append(module)   
                
                                                                                        
            # print('hey',i.prjctasgnmnt)
        module = ModuleManagement.objects.filter(developer__user__username = request.user.username)
        filters = ProjectFilter(request.GET,queryset=all_project)
        return render(request,'project.html',{'all_project':all_project,'form':form,'clients':clients,'obj1':obj1,'filters':filters,'filters1':filters1,'module':module,'request':request, 'user_modules': user_modules,'all_module':all_module})
    elif request.user.extendedusermodel.is_telecallers:
        obj1 = Leads.objects.filter(lead_statuss__name = 'ConvertToProject')  
        filters1 = LeadsFilter(request.GET,queryset=obj1)  
        all_project = Project.objects.all().order_by('client__contact_person_name')
        filters = ProjectFilter(request.GET,queryset=all_project)
        return render(request,'project.html',{'all_project':all_project,'form':form,'clients':clients,'obj1':obj1,'filters':filters,'filters1':filters1})
    elif request.user.extendedusermodel.is_teamleader:
        obj1 = Leads.objects.filter(lead_statuss__name = 'ConvertToProject')  
        filters1 = LeadsFilter(request.GET,queryset=obj1)       
        all_project = Project.objects.all().order_by('client__contact_person_name')
        filters = ProjectFilter(request.GET,queryset=all_project)
        return render(request,'project.html',{'all_project':all_project,'form':form,'clients':clients,'obj1':obj1,'filters':filters,'filters1':filters1})
    # elif request.user.extendedusermodel.is_client:
    else:
        # if request.user.is_superuser:
        #     user = request.user
        # else:
        user = request.user.extendedusermodel.employe_name
        obj1 = Leads.objects.filter(lead_statuss__name = 'ConvertToProject') 
        filters1 = LeadsFilter(request.GET,queryset=obj1)       
        clientproject = Project.objects.filter(client__owner_name__icontains=user)
        filters = ProjectFilter(request.GET,queryset=clientproject)
        return render(request,'project.html',{'clientproject':clientproject,'clients':clients,'obj1':obj1,'filters':filters,'filters1':filters1
        
        })
     
    # # print(clientproject)
    
    # context = {
    #     'clientproject':clientproject,
    #     "all_project":all_project,
    #     'clients':clients,
    #     'form':form,
    #     }
    # return render(request,'project.html',context)

def assigned_poject(request):
    all_project = ModuleManagement.objects.filter(developer__user__username=request.user.username,project_assignment__project_assignment__user__username=request.user.username)
    context = {
        'all_project' : all_project
    }
    return render(request,'project_asigned.html',context)


            
@login_required
def project_view(request,slug):
    qs = Project.objects.filter(slug=slug).first()
    form = ProjectAddForm(instance=qs)
    context = {
        'form':form,
    }
    return render(request,'project_view.html',context)


@login_required
def project_edit(request,slug):
    k = str(time.time()).encode('utf-8')
    h = blake2b(key=k, digest_size=10)
    key = h.hexdigest()
    context = {}  
    teammember = ExtendedUserModel.objects.filter(is_teammember='on')
    form = ProjectAddForm(request.POST or None)
    qs = Project.objects.get(slug=slug)
    if request.method == 'POST':
        name = request.user.username
        addedby = ExtendedUserModel.objects.get(user__username = name)
        msg = request.POST.get('message')
        dcmnt = request.FILES.get('document')
        qs = Project.objects.get(slug=slug)
        form = ProjectAddForm(request.POST,request.FILES,instance=qs)
        chckbx = request.POST.getlist('project_assignment')
        client_key = qs.client
        # project_title = qs.project_title
        if form.is_valid():
            project = form.save(commit=False)
            project.save()
            for i in chckbx:
                print(i)
                r = ExtendedUserModel.objects.get(id=int(i))
                ProjectAssignment.objects.create(project=project,project_assignment = r.employe_name,project_assignment_key = key,client = client_key,added_by = addedby, message = msg, document= dcmnt )
        return redirect('Crm_app:project')

        # else:
        #     print(formset.errors)
            # print(form.cleaned_data)
    qs = Project.objects.get(slug=slug)
    form = ProjectAddForm(instance=qs)
    project_assign_form = ProjectAssignmentForm()
    context['form'] = form
    context['teammember'] = teammember
    context['project_assign_form'] = project_assign_form
    return render(request,'project_edit.html',context)

    # --------------------prjctassgnmnt-------------------------------

@login_required
def project_assignment_add(request,slug):
    k = str(time.time()).encode('utf-8')
    h = blake2b(key=k, digest_size=10)
    key = h.hexdigest()
    qs = Project.objects.get(slug=slug)
    title = qs.project_title
    client_key = qs.client
    name = request.user.username
    addedby = ExtendedUserModel.objects.get(user__username = name)
    ProjectAssignmentFormset = modelformset_factory(ProjectAssignment,ProjectAssignmentForm,max_num=1)
    # project_assign_form = ProjectAssignmentForm()
    form = ProjectAssignmnetProjectForm(instance=qs)
    formset = ProjectAssignmentFormset(request.POST or None,request.FILES or None, queryset= qs.products.all(), prefix='products')
    if request.method == 'POST':
        # project_assign_form = ProjectAssignmentForm(request.POST,request.FILES)
        if formset.is_valid():
            for product in formset:
                d = product.save(commit=False)
                d.project_assignment_key = key
                d.client = client_key
                d.project = qs
                d.added_by = addedby
                d.save()
                print(formset)
            product.save_m2m()

            return redirect('Crm_app:project')
        else:
            print(formset.errors)
            # print(formset.cleaned_data)

    
    form = ProjectAssignmnetProjectForm(instance=qs)      
    project_assign_form = ProjectAssignmentForm()
    context = {
        'formset':formset,       
        'form':form 
        }
    return render(request,'project_assignment_add.html',context)

    


@login_required
def list_prjct_assgnmnt(request):
    qs = ProjectAssignment.objects.all()
    context={'qs':qs}
    return render(request,'prjctasgnmnt.html',context)

@login_required
def project_assignment_edit(request,id):
    chckbx = request.POST.getlist('project_assignment')
    if request.method == 'POST':
        qs = ProjectAssignment.objects.get(id=id)
        form = ProjectAssignmentForm(request.POST,instance=qs)
        for i in chckbx:
            r = ExtendedUserModel.objects.get(id=int(i))
            if form.is_valid():
                form.save()
                return redirect('Crm_app:projectassgnmnt')
    else:
        qs =ProjectAssignment.objects.get(id=id)
        form = ProjectAssignmentForm(instance=qs)
    return render(request,'prjct_asgnmnt_edit.html',{'form':form})



        


def prjct_assgnmnt_delete(requesr,id):
    qs = ProjectAssignment.objects.filter(id=id)
    qs.delete()
    return redirect('Crm_app:projectassgnmnt')




# # ---------------------ModuleAssgnmnt----------------------------------------


@login_required
def project_module_add(request,slug):
    qs = Project.objects.get(slug=slug)
    k = str(time.time()).encode('utf-8')
    h = blake2b(key=k, digest_size=10)
    key = h.hexdigest()
    name = request.user.username
    createdby = ExtendedUserModel.objects.get(user__username = name)
    form = ProjectModuleForm()
    form2 = ProjectAssignmnetProjectForm(instance=qs)
    if request.method == 'POST':
        form = ProjectModuleForm(request.POST)
        if form.is_valid():
            data = form.save(commit=False)
            data.project_module_key = key
            data.created_by = createdby
            data.project = qs
            data.save()
        return redirect('Crm_app:project')
    else:
        form = ProjectModuleForm()
        qs = Project.objects.get(slug=slug)
        form2 = ProjectAssignmnetProjectForm(instance=qs)

    qs = ProjectModule.objects.filter(project=qs)
    
    context = {
        'form':form,
        'form2':form2,
        'qs':qs
        }
    return render(request,'project_module.html',context)



# def view_module(request,slug):
#     qs = Project.objects.get(slug=slug)
















@login_required
def project_module_edit(request,id):
    if request.method == 'POST':
        qs = ProjectModule.objects.get(id=id)
        form = ProjectModuleForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:prjctmodule')
    else:
        qs = ProjectModule.objects.get(id=id)
        form = ProjectModuleForm(instance=qs)
    return render(request,'project_module_edit.html',{'form':form})



@login_required
def project_module_delete(request,id):
    qs = ProjectModule.objects.get(id=id)
    qs.delete()
    return redirect('Crm_app:project')


@login_required
def project_module_view(request,id):
    qs = ProjectModule.objects.filter(id=id).first()
    form = ProjectModuleForm(instance=qs)
    context = {
        'form':form,
    }
    return render(request,'project_module_view.html',context)


# -------------------------------------Module Management---------------------------------------

@login_required
def module_management(request,id):
    context = {}
    d = []
    k = str(time.time()).encode('utf-8')
    h = blake2b(key=k, digest_size=10)
    key = h.hexdigest()
    qs = ProjectModule.objects.get(id=id)  
    print('qs',qs)
    project = qs.project
    projects = qs.project.products.all()
    print('project',projects)
    team = ExtendedUserModel.objects.filter(is_teammember='on')
    developerr = ProjectAssignment.objects.filter(project=project).first()
    developer = ProjectAssignment.objects.filter(project=project)
    print(developer)
    for i in developer:
        for project_assignment in i.project_assignment.all():
            print('hry grl',project_assignment)
    
    name = request.user.username
    created = ExtendedUserModel.objects.get(user__username = name)
    print(created)
    ModuleManagementFormset = modelformset_factory(ModuleManagement,ModuleManagementForm,max_num=1)
    form = ProjectModuleForm(instance=qs)
    # form_kwargs={'developer': developer}
    formset = ModuleManagementFormset(request.POST or None,queryset= qs.module.all(), form_kwargs={'developer': developer}, prefix='module')
    if request.method == 'POST':
        if formset.is_valid():
            for product in formset:
                d = product.save(commit=False)
                d.module_mngmnt_key = key
                d.project = project
                d.module = qs
                d.added_by = created 
                d.project_assignment = developerr
                d.save()
                print(request.POST)
            product.save_m2m()

            return redirect('Crm_app:project')

        else:
            print(formset.errors)
    
    
    form = ProjectModuleForm(instance=qs)   
    # developers = ProjectAssignment.objects.filter(project_assignment__isnull=False,project=project)
    # print(developers)
    context = {
        'developer': developer,
        'formset':formset,       
        'form':form 
        }
    return render(request,'module_mngmnt.html',context)

        

@login_required
def module_management_delete(request,id):
    qs = ModuleManagement.objects.get(id=id)
    qs.delete()
    return redirect('Crm_app:project')


# @login_required
# def view_developers_here(request,id):
#     qs = ProjectModule.objects.filter(id=id).first()
#     form = ProjectModuleForm(instance=qs)
#     DevelopersFormset = modelformset_factory(ModuleManagement,ModuleManagementForm1,max_num=1)
#     formset = DevelopersFormset(request.POST or None, queryset= qs.module.all(), prefix='module')
#     dev = ExtendedUserModel.objects.filter(is_teammember='on')
#     for i in dev:
#         print(i)

#     # qs1 = ModuleManagement.objects.get(project=qs)
#     # form2 = ModuleManagementForm(instance=qs1)

#     context = {
#         'form':form,
#         'formset':formset,
#         'dev':dev
#     }
#     return render(request,'view_developers.html',context)








@login_required  
def download(request,path):
    file_path = os.path.join(settings.MEDIA_ROOT,path)
    if os.path.exists(file_path):
        with open(file_path,'rb')as fh:
            response=HttpResponse(fh.read(),content_type="application/document")
            response['Content-Disposition']='inline;filename='+os.path.basename(file_path)
            return response
    
    raise Http404

@login_required
def project_delete(request,slug):
    qs = Project.objects.filter(slug=slug)
    for i in qs:
        client = Client.objects.filter(contact_person_name=i.client)
        for j in client:
            j.project_count = j.project_count-1
            j.save()
    qs.delete()
    return redirect('Crm_app:project')

@login_required
def running_project(request):
    running_project = Project.objects.filter(project_status__name='Runningproject')
    context ={
        'running_project':running_project
    }
    return render(request,'running-project.html',context)


@login_required
def suspended_project(request):
    suspended_project = Project.objects.filter(project_status__name='SuspendedProject')
    context ={
        'suspended_project':suspended_project
    }
    return render(request,'suspended-project.html',context)


@login_required
def closed_project(request):
    closed_project = Project.objects.filter(project_status__name='ClosedProject')
    context ={
        'closed_project':closed_project
    }
    return render(request,'closed-project.html',context)

@login_required
def lead_project_delete(request,slug):
    qs = Leads.objects.filter(slug=slug)
    qs.delete()
    return redirect('Crm_app:project')


@login_required
def lead_project_edit(request,slug):
    if request.method == 'POST':
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:project')
    else:
        qs = Leads.objects.get(slug=slug)
        form = LeadEditForm(instance=qs)
    return render(request,'lead_edit.html',{'form':form})




@login_required
def telecaller_detail(request):
    telecaller = ExtendedUserModel.objects.filter(is_telecallers ='on')
    tele = Leads.objects.filter(staff__is_telecallers='on')
    
    print(telecaller)


@login_required
def team_leader_details(request):
    team_leader = ExtendedUserModel.objects.filter(is_teamleader ='on')
    context = {
        'team_leader':team_leader
    }
    return render(request,'teamleader.html',context)

@login_required
def team_leader_view(request,id):
    qs = ExtendedUserModel.objects.filter(id=id).first()
    print(qs)
    form = TeamleaderViewForm(instance=qs)
    context = {
        'form':form,
    }
    return render(request,'teamleaderview.html',context)


@login_required
def team_leader_edit(request,id):
    key = Fernet.generate_key()
    f_obj = Fernet(key)
    if request.method == 'POST':
        qs = ExtendedUserModel.objects.get(id=id)
        print(qs.user.password)
        form = TeamleaderEditForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('Crm_app:listteamleader')
    else:
        qs = ExtendedUserModel.objects.get(id=id)
        form = TeamleaderEditForm(instance=qs)
    return render(request,'teamleader_edit.html',{'form':form})
        

@login_required
def teamleader_delete(request,id):
    qs = ExtendedUserModel.objects.filter(id=id)
    qs.delete()
    return redirect('Crm_app:listteamleader')




























#-----------------------------------------------LOGIN CREDENTIALS------------------------------------------
@login_required
def admin_register(request):
    if request.method == "POST":
        username = request.POST.get('username')
        email = request.POST.get('email')
        password1 = request.POST.get("password1")
        password2 = request.POST.get("password2")  
        if password1 == password2:
            if User.objects.filter(username=username).exists():
                print("username alredy exists")
                messages.info(request,"username already exist")
                return redirect("Crm_app:admin_register")
            elif User.objects.filter(email=email).exists():
                print("email alredy exists")
                messages.info(request,"email already registered")
                return redirect("crm_app:admin_register")
            else:
                user = User.objects.create_user(username=username,email=email,password=password1,is_superuser=True,is_active=True,is_staff=True)
                user.save()
                print('user created')
                # # MESSAGE SENDING CODE
                # template = render_to_string('admin-register-email.html',{'emp_name':username})
                # email = EmailMessage(
                #     'Account Registration', #subject
                #     template, #body
                #     settings.EMAIL_HOST_USER, #sender mail id
                #     [email] #recever mail id
                # )
                # email.fail_silently = False
                # email.send()
                return redirect('Crm_app:staff_login')
        else:
            print('Password Not Matched')
            messages.info(request,"Incorrect Password")
            return redirect('Crm_app:admin_register')    
    return render(request,"admin-register.html")

@login_required
def register(request):
    if request.method == 'POST':
        if request.POST.get('password1') == request.POST.get('password2'):
            try:
                user = User.objects.get(username=request.POST.get('username'))
                print('username already taken')
                return render(request,'staff_register.html',{'error':"Employee Id alredy taken"})
                
            except User.DoesNotExist:
                user = User.objects.create_user(username = request.POST.get('username'), password = request.POST.get('password1'),email=request.POST.get('email'))
                emp_name = request.POST.get('emp_name')
                emp_id = request.POST.get('username')
                email = request.POST.get('email')
                address = request.POST.get('address')
                dob = request.POST.get('dob')
                bloodgroup = request.POST.get('bloodgroup')
                phn = request.POST.get('phn')
                telecaller = request.POST.get('staff')
                teamleader = request.POST.get('teamleader')
                client = request.POST.get('client')
                teammember = request.POST.get('teammember')

                # superviser = request.POST.get('supervisor')
                # designer = request.POST.get('designer')
                # dealer = request.POST.get('dealer')
                # technician = request.POST.get('technician')
                # factory_supervisor = request.POST.get('factorysupervisor')
                user_img = request.FILES.get('user_img')
                # is_superviser=superviser,is_designer=designer,is_dealer=dealer,is_technician=technician,is_factory_superviser=factory_supervisor,showroom=showroom
                extenduser = ExtendedUserModel(user_photo=user_img,dob=dob,phn_number=phn,employe_name=emp_name,user=user,address=address,blood_group=bloodgroup,is_telecallers=telecaller,is_teamleader=teamleader,is_client=client,is_teammember=teammember)
                extenduser.save()
                print('user created')
                auth.login(request,user)
                # MESSAGE SENDING CODE
                # template = render_to_string('resgisteremail.html',{'emp_name':emp_name,'emp_id':emp_id})
                # email = EmailMessage(
                #     'Account Registration', #subject
                #     template, #body
                #     settings.EMAIL_HOST_USER, #sender mail id
                #     [email] #recever mail id
                # )
                # email.fail_silently = False
                # email.send()
                return redirect('Crm_app:staff_login')
                # return render(request,'staff_register.html')
        else:
            print('password not matching')
            return render(request,'staff_register.html',{'error':'Password Does Not Match'})
    else:
        return render(request,'staff_register.html')



def staff_login(request):
    form = LoginForm()
    message = ''
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password'],
            )
            # if user is not None:
            #     login(request, user)
            #     return redirect('Crm_app:index')
            if user is not None:
                request.session['username'] = form.cleaned_data['username']
                auth.login(request,user)
                print('logged in')
                return JsonResponse(
                    {'success':True},
                    safe=False
                )
            else:
                auth.login
                return JsonResponse(
                    {'success':False},
                    safe=False
                )
        message = 'Login failed!'
    else:
        return render(request,'staff_login.html',context={'form': form, 'message': message})
  

def crm_logout(request):
    logout(request)
    # messages.info(request, "Logged out successfully!")
    return redirect("Crm_app:staff_login")
    

