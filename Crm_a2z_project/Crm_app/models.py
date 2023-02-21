# from pickle import TRUE
# from django import views
import random
import string
import django
# from django.db import models
from django.contrib.auth.models import User
from datetime import datetime, timedelta
from django.db import models
# from django.db import models
# from django.contrib.auth.models import User
# from django.forms import CharField
# from django.shortcuts import redirect
# from twilio.rest import Client
# from django.template.loader import render_to_string
import uuid

from django.utils.timezone import localdate
import string, random
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.utils.text import slugify
from hashlib import blake2b
import time


# Create your models here.


MODULE_STATUS_CHOICES = (

        ('0', '0'),
        ('0', '0'),
        ('1', '1'),
       
)

class LeadCategory(models.Model):
    name = models.CharField(max_length=30,blank=True,null=True)

    def __str__(self):
        return self.name

class State(models.Model):
    name = models.CharField(max_length=30,blank=True,null=True)

    def __str__(self):
        return self.name

class District(models.Model):
    name = models.CharField(max_length=30,blank=True,null=True)
    state =models.ForeignKey(State,on_delete=models.CASCADE,blank=True,null=True)

    def __str__(self):
        return self.name

# class City(models.Model):
#     name = models.CharField(max_length=30,blank=True,null=True)
#     district = models.ForeignKey(District,on_delete=models.CASCADE,blank=True,null=True)

#     def __str__(self):
#         return self.name


class LeadType(models.Model):
    name = models.CharField(max_length=30,null=True,blank=True)

    def __str__(self):
        return self.name

class LeadSource(models.Model):
    name = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.name



class LeadStatus(models.Model):
    name = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.name

# def get_status():
#         return Status.objects.get(id=1)

class ClientStatus(models.Model):
    name = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.name

class ProjectStatus(models.Model):
    name = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.name
    
class InvoiceStatus(models.Model):
    name = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.name


class ExtendedUserModel(models.Model):
    def __str__(self):
        return self.employe_name
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    employe_name = models.CharField(max_length=25)
    address = models.TextField()
    dob = models.DateField()
    blood_group = models.CharField(max_length=5,blank=True,null=True)
    phn_number = models.CharField(max_length=15)
    is_telecallers = models.CharField(max_length=10,blank=True,null=True)
    is_teamleader = models.CharField(max_length=10,blank=True,null=True)
    is_client = models.CharField(max_length=10,blank=True,null=True)
    is_teammember = models.CharField(max_length=10,blank=True,null=True)


    is_staff = models.CharField(max_length=10,blank=True,null=True)
    is_superviser = models.CharField(max_length=10,blank=True,null=True)
    is_designer = models.CharField(max_length=10,blank=True,null=True)
    is_dealer = models.CharField(max_length=10,blank=True,null=True)
    is_technician = models.CharField(max_length=10,blank=True,null=True)
    is_factory_superviser = models.CharField(max_length=10,blank=True,null=True)
    user_photo = models.ImageField(upload_to = 'pictures',blank=True,null=True)       


class Leads(models.Model):
    def __str__(self):
        return self.title
    staff = models.ForeignKey(ExtendedUserModel,on_delete=models.CASCADE, null=True, blank=True)
    staff_name = models.ForeignKey(User,on_delete=models.CASCADE, null=True, blank=True)
    category = models.ForeignKey(LeadCategory,on_delete=models.SET_NULL, blank=True, null=True)
    title = models.CharField(max_length=30, blank=True, null=True,verbose_name='Title')
    key = models.CharField(max_length=25, blank=True, null=True)
    slug = models.SlugField(max_length=250, blank=True, null=True)
    state = models.ForeignKey(State,on_delete=models.SET_NULL, blank=True, null=True)
    district = models.ForeignKey(District,on_delete=models.SET_NULL, blank=True, null=True)
    place = models.CharField(max_length=50,blank=True,null=True)
    business_name = models.CharField(max_length=50,blank=False,null=False)
    address = models.TextField(max_length=250, blank=False, null=False)
    contact_person = models.CharField(max_length=30, blank=True, null=True)
    contact_person_number = models.CharField(max_length=12, null=True, blank=True)
    contact_person_designation = models.CharField(max_length=50, blank=True, null=True)
    contact_person_email = models.EmailField(blank=True,null=True)
    business_owner_name = models.CharField(max_length=30, blank=False, null=False)
    business_owner_number = models.CharField(max_length=12, blank=False, null=False)
    business_owner_email = models.EmailField(blank=True,null=True)
    requirements =  models.TextField(blank=True,null=True)
    notes = models.TextField(blank=True,null=True)
    callbackdate = models.DateField(blank=True,null=True)
    interest_choices = (
        ('1','1'),
        ('2','2'),
        ('3','3'),
        ('4','4'),
        ('5','5')
    )
    interest_rate= models.CharField(max_length=25,choices=interest_choices,blank=True,null=False)
    date_added_on = models.DateTimeField(default=django.utils.timezone.now,blank=False, null=False)
    actual_date_added_on = models.DateTimeField(auto_now_add=True,blank=False,null=False)
    lead_type = models.ForeignKey(LeadType,on_delete=models.SET_NULL,blank=True,null=True)
    lead_source = models.ForeignKey(LeadSource, on_delete=models.SET_NULL, blank=True, null=True)
    # status = models.ForeignKey(Status, on_delete=models.SET_NULL,default='Freshlead',blank=True, null=True)
    lead_statuss = models.ForeignKey(LeadStatus, on_delete=models.SET_NULL,default=1,blank=True, null=True)

def create_slug(instance, new_slug=None):
    slug = slugify(instance.key)
    if new_slug is not None:
        slug = new_slug
    qs= Leads.objects.filter(slug=slug).order_by("-id")
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" %(slug, qs.first().id)
        return create_slug(instance, new_slug=new_slug)
    return slug


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_slug(instance)



pre_save.connect(pre_save_post_receiver, sender=Leads)





class Client(models.Model):

    def __str__(self):
        return self.contact_person_name
    
    c_key = models.CharField(max_length=25, blank=True, null=True)
    slug = models.SlugField(max_length=250, blank=True, null=True)
    contact_person_name = models.CharField(max_length=30, blank=True,null=True)
    contact_person_phone_no = models.CharField(max_length=12, blank=True, null=True)
    business_name = models.CharField(max_length=50,blank=False,null=False)
    business_address = models.TextField(max_length=250, blank=False, null=False)
    owner_name = models.CharField(max_length=30, blank=False, null=False)
    business_owner_contact_number = models.CharField(max_length=12, blank=False, null=False)
    # client_sts_choices = (
    #     ('-1','-1'),
    #     ('0','0'),
    #     ('1','ActiveClient'),
    #     ('4','4'),
    #     ('5','5')
    # )
    # client_status= models.CharField(max_length=25,choices=client_sts_choices,blank=True,null=False,default=0)
    client_status = models.ForeignKey(ClientStatus, on_delete=models.SET_NULL,default=2,blank=True, null=True)
    project_count = models.IntegerField(blank=True,null=True,default=0)
 



def create_slug_client(instance, new_slug=None):
    slug = slugify(instance.c_key)
    if new_slug is not None:
        slug = new_slug
    qs= Client.objects.filter(slug=slug).order_by("-id")
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" %(slug, qs.first().id)
        return create_slug_client(instance, new_slug=new_slug)
    return slug


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_slug_client(instance)



pre_save.connect(pre_save_post_receiver, sender=Client)

class Project(models.Model):
    def __str__(self):
        return self.project_title
    p_key = models.CharField(max_length=25, blank=True, null=True)
    slug = models.SlugField(max_length=250, blank=True, null=True)
    client = models.ForeignKey(Client, on_delete=models.SET_NULL, blank=True, null=True,)
    project_title = models.CharField(max_length=30, blank=True, null=True,verbose_name='Title')
    requirements =  models.TextField(blank=True,null=True)
    category = models.ForeignKey(LeadCategory,on_delete=models.SET_NULL, blank=True, null=True)
    interest_choices = (
        ('1','1'),
        ('2','2'),
        ('3','3'),
        ('4','4'),
        ('5','5')
    )
    interest_rate= models.CharField(max_length=25,choices=interest_choices,blank=True,null=False)
    notes = models.TextField(blank=True,null=True)    
    project_status = models.ForeignKey(ProjectStatus, on_delete=models.SET_NULL,default=1,blank=True, null=True)
    # client_sts_choices = (
    #     ('Junk','Junk'),
    #     ('ActiveClient','Deactivate'),
    #     ('ActiveClient','ActiveClient'),
    #     ('4','4'),
    #     ('5','5')
    # )
    # client_status = models.ForeignKey(ClientStatus, on_delete=models.SET_NULL,default=3,blank=True, null=True)
    date_added_on = models.DateTimeField(default=django.utils.timezone.now,blank=False, null=False)
    actual_date_added_on = models.DateTimeField(auto_now_add=True,blank=False,null=False)
    lead = models.ForeignKey(Leads, on_delete=models.SET_NULL, blank=True, null=True,)


def create_slug1(instance, new_slug=None):
    slug = slugify(instance.p_key)
    if new_slug is not None:
        slug = new_slug
    qs= Project.objects.filter(slug=slug).order_by("-id")
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" %(slug, qs.first().id)
        return create_slug1(instance, new_slug=new_slug)
    return slug


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_slug1(instance)



pre_save.connect(pre_save_post_receiver, sender=Project)


class Invoice(models.Model):
    def __str__(self):
        return self.invoice_public_key

    invoice_key = models.CharField(max_length=25, blank=True, null=True)
    slug = models.SlugField(max_length=250, blank=True, null=True)
    invoice_public_key = models.CharField(max_length=25, blank=True, null=True)
    amount = models.PositiveIntegerField(blank=True,null=True)
    pending_amount = models.PositiveIntegerField(blank=True,null=True)
    client = models.ForeignKey(Client, on_delete=models.SET_NULL, blank=True, null=True)
    project = models.ForeignKey(Project, on_delete=models.SET_NULL, blank=True, null=True)
    added_by = models.ForeignKey(User,on_delete=models.CASCADE, null=True, blank=True)
    added_on = models.DateTimeField(auto_now_add=True,blank=False,null=False)
    creation_date = models.DateTimeField(default=django.utils.timezone.now,blank=False, null=False)
    expiry_date = models.DateField(blank=True,null=True)
    invoice_status = models.ForeignKey(InvoiceStatus,on_delete=models.CASCADE, null=True, blank=True,default=0)


def create_slug_invoice(instance, new_slug=None):
    slug = slugify(instance.invoice_key)
    if new_slug is not None:
        slug = new_slug
    qs= Invoice.objects.filter(slug=slug).order_by("-id")
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" %(slug, qs.first().id)
        return create_slug_invoice(instance, new_slug=new_slug)
    return slug


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_slug_invoice(instance)



pre_save.connect(pre_save_post_receiver, sender=Invoice)


class Billing(models.Model):
    billing_key = models.CharField(max_length=25, blank=True, null=True)
    slug = models.SlugField(max_length=250, blank=True, null=True)
    billing_public_key = models.CharField(max_length=25, blank=True, null=True)
    client = models.ForeignKey(Client, on_delete=models.SET_NULL, blank=True, null=True)
    project = models.ForeignKey(Project, on_delete=models.SET_NULL, blank=True, null=True)
    invoice = models.ForeignKey(Invoice, on_delete=models.SET_NULL, blank=True, null=True)
    amount = models.PositiveIntegerField(blank=True,null=True)
    added_by = models.ForeignKey(User,on_delete=models.CASCADE, null=True, blank=True)
    added_on = models.DateTimeField(auto_now_add=True,blank=False,null=False)
    creation_date = models.DateTimeField(default=django.utils.timezone.now,blank=False, null=False)
    direction_choices = (
        ('-1','-1'),
        ('1','1'),    
    )
    direction = models.CharField(max_length=25,choices=direction_choices,blank=True,null=False,default=1)




def create_slug_billing(instance, new_slug=None):
    slug = slugify(instance.billing_key)
    if new_slug is not None:
        slug = new_slug
    qs= Billing.objects.filter(slug=slug).order_by("-id")
    exists = qs.exists()
    if exists:
        new_slug = "%s-%s" %(slug, qs.first().id)
        return create_slug_billing(instance, new_slug=new_slug)
    return slug


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_slug_billing(instance)



pre_save.connect(pre_save_post_receiver, sender=Billing)


class ProjectAssignment(models.Model):
    def __str__(self):
        return self.message
    class Meta:
        verbose_name_plural = 'Project Assignment'
        
    project_assignment_key = models.CharField(max_length=25, blank=True, null=True)
    client = models.ForeignKey(Client, on_delete=models.SET_NULL, blank=True, null=True)
    project = models.ForeignKey(Project,related_name = "products",on_delete=models.SET_NULL, blank=True, null=True)
    added_by = models.ForeignKey(ExtendedUserModel,on_delete=models.CASCADE,null=True,blank=True)
    added_on = models.DateField(auto_now_add=True,blank=False,null=False)
    project_assignment = models.ManyToManyField(ExtendedUserModel,related_name='project_assignment', blank=True)
    message = models.TextField(max_length=250, blank=True, null=True)
    document = models.FileField(upload_to='documents/',blank=True, null=True)
    project_start_date = models.DateField(blank=True,null=True)
    # project_end_date =


# class ModuleManagement(models.Model):
#     def __str__(self):
#         return self.module_name
        
#     module_management_key = models.CharField(max_length=25, blank=True, null=True)
#     module_name = models.CharField(max_length=30, blank=True, null=True)
#     module_description = models.TextField(max_length=250, blank=True, null=True)
#     module_start_date = models.DateField(blank=True,null=True)
#     project = models.ForeignKey(Project,blank=True,null=True,on_delete=models.SET_NULL)
#     prjct_assignment = models.ForeignKey(ProjectAssignment,related_name = "prjct_assignment",blank=True,null=True,on_delete=models.SET_NULL)
#     module_assigned =  models.ManyToManyField(ExtendedUserModel,blank=True,null=True,related_name='module_assigned')


class ProjectModule(models.Model):
    def __str__(self):
        return self.module_title

    project_module_key = models.CharField(max_length=25, blank=True, null=True)
    module_title = models.CharField(max_length=30, blank=True, null=True)
    module_description = models.TextField(max_length=250, blank=True, null=True)
    # created_by = models.ForeignKey(ExtendedUserModel,on_delete=models.CASCADE,null=True,blank=True)
    created_by = models.CharField(max_length=25, blank=True, null=True)
    project = models.ForeignKey(Project,on_delete=models.CASCADE,null=True,blank=True)
    module_status = models.CharField(
        max_length=2,
        choices=MODULE_STATUS_CHOICES,
        default=1,
    )
    added_on = models.DateTimeField(auto_now_add=True,blank=False,null=False)



class ModuleManagement(models.Model):

    module_mngmnt_key = models.CharField(max_length=25, blank=True, null=True)
    project = models.ForeignKey(Project, on_delete=models.SET_NULL, blank=True, null=True)
    module = models.ForeignKey(ProjectModule, on_delete=models.SET_NULL, blank=True, null=True) 
    added_by = models.CharField(max_length=25, blank=True, null=True)
    added_on = models.DateTimeField(auto_now_add=True,blank=False,null=False)
    developer_id = models.ManyToManyField(ExtendedUserModel,related_name='developer_id', blank=True)
    start_date = models.DateField(blank=True,null=True)
    end_date = models.DateField(blank=True,null=True)
    project_assignment = models.ForeignKey(ProjectAssignment, on_delete=models.SET_NULL, blank=True, null=True)


    




    




    
    

