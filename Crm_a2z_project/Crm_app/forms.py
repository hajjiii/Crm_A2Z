from .models import LeadCategory, ProjectAssignment, State, District,  Leads, LeadSource,ExtendedUserModel , LeadType, LeadStatus, Client, Project

from django import forms


class LeadAddForm(forms.ModelForm):
    class Meta:
        model = Leads
        fields = '__all__'
        exclude = ['actual_date_added_on','statuss','key','staff_name']
        widgets ={
            'category' : forms.Select(attrs={'class':'form-control'}),
            'lead_source' : forms.Select(attrs={'class':'form-control'}),
            'title' : forms.TextInput(attrs={'class':'form-control'}),
            'date_added_on': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'state' : forms.Select(attrs={'class':'form-control'}),
            'district' : forms.Select(attrs={'class':'form-control'}),
            'place' : forms.TextInput(attrs={'class':'form-control'}),
            'business_name' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_designation' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_number' : forms.TextInput(attrs={'class':'form-control',}),
            'contact_person_email' : forms.EmailInput(attrs={'class':'form-control'}),
            'business_owner_name' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_number' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_email' : forms.EmailInput(attrs={'class':'form-control'}),
            'address' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'requirements' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'callbackdate': forms.DateTimeInput(attrs={'class': 'form-control','type': 'date'}),
            'interest_rate' : forms.Select(attrs={'class':'form-control'}),
            'notes' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'lead_type' : forms.Select(attrs={'class':'form-control'}),

        } 
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['district'].queryset = District.objects.none()

        if 'state' in self.data:
            try:
                state_id = int(self.data.get('state'))
                self.fields['district'].queryset = District.objects.filter(state_id=state_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            self.fields['district'].queryset = self.instance.state.district_set.all()



class LeadEditForm(forms.ModelForm):
    class Meta:
        model = Leads
        fields = '__all__'
        exclude = ['actual_date_added_on','statuss','key','staff_name','id']
        widgets ={
            'category' : forms.Select(attrs={'class':'form-control'}),
            'lead_source' : forms.Select(attrs={'class':'form-control'}),
            'title' : forms.TextInput(attrs={'class':'form-control'}),
            'date_added_on': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'state' : forms.Select(attrs={'class':'form-control'}),
            'district' : forms.Select(attrs={'class':'form-control'}),
            'place' : forms.TextInput(attrs={'class':'form-control'}),
            'business_name' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_designation' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_number' : forms.TextInput(attrs={'class':'form-control',}),
            'contact_person_email' : forms.EmailInput(attrs={'class':'form-control'}),
            'business_owner_name' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_number' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_email' : forms.EmailInput(attrs={'class':'form-control'}),
            'address' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'requirements' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'callbackdate': forms.DateInput(attrs={'class': 'form-control','type': 'date'}),
            'interest_rate' : forms.Select(attrs={'class':'form-control'}),
            'notes' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'lead_type' : forms.Select(attrs={'class':'form-control'}),

        }
    # def __init__(self, *args, **kwargs):
    #     super().__init__(*args, **kwargs)
    #     self.fields['district'].queryset = District.objects.none()

    #     if 'state' in self.data:
    #         try:
    #             state_id = int(self.data.get('state'))
    #             self.fields['district'].queryset = District.objects.filter(state_id=state_id).order_by('name')
    #         except (ValueError, TypeError):
    #             pass  # invalid input from the client; ignore and fallback to empty  queryset
    #     elif self.instance.id:
    #         self.fields['district'].queryset = self.instance.state.district_set.all()
    


class LeadViewForm(forms.ModelForm):
    class Meta:
        model = Leads
        fields="__all__"
        exclude = ['actual_date_added_on','statuss']

        widgets ={
            'category' : forms.Select(attrs={'class':'form-control'}),
            'lead_source' : forms.Select(attrs={'class':'form-control'}),
            'title' : forms.TextInput(attrs={'class':'form-control'}),
            'date_added_on': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'state' : forms.Select(attrs={'class':'form-control'}),
            'district' : forms.Select(attrs={'class':'form-control'}),
            'place' : forms.TextInput(attrs={'class':'form-control'}),
            'business_name' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_designation' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_number' : forms.TextInput(attrs={'class':'form-control',}),
            'contact_person_email' : forms.EmailInput(attrs={'class':'form-control'}),
            'business_owner_name' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_number' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_email' : forms.EmailInput(attrs={'class':'form-control'}),
            'address' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'requirements' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'callbackdate': forms.DateInput(attrs={'class': 'form-control','type': 'date'}),
            'interest_rate' : forms.Select(attrs={'class':'form-control'}),
            'notes' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'lead_type' : forms.Select(attrs={'class':'form-control'}),

        } 

class StatusEditForm(forms.ModelForm):
    class Meta:
        model = Leads
        fields = ['lead_statuss']
        widgets ={
            'lead_statuss' : forms.Select(attrs={'class':'form-control'}),

        }
   


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)
   

class ClientAddForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = "__all__"
        exclude =['c_key']
        widgets ={
            'contact_person_name' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_phone_no' : forms.TextInput(attrs={'class':'form-control',}),
            'business_name' : forms.TextInput(attrs={'class':'form-control'}),
            'business_address' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'owner_name' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_contact_number' : forms.TextInput(attrs={'class':'form-control'}),
        } 



class ClientViewForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = "__all__"
        exclude =['c_key']
        widgets ={
            'contact_person_name' : forms.TextInput(attrs={'class':'form-control'}),
            'contact_person_phone_no' : forms.TextInput(attrs={'class':'form-control',}),
            'business_name' : forms.TextInput(attrs={'class':'form-control'}),
            'business_address' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'owner_name' : forms.TextInput(attrs={'class':'form-control'}),
            'business_owner_contact_number' : forms.TextInput(attrs={'class':'form-control'}),
        } 


class ProjectAddForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = "__all__"
        exclude = ['p_key','actual_date_added_on','client']
    
        widgets ={
            # 'client' : forms.Select(attrs={'class':'form-control'}),
            'project_title' : forms.TextInput(attrs={'class':'form-control'}),
            'requirements' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'category' : forms.Select(attrs={'class':'form-control'}),
            'interest_rate' : forms.Select(attrs={'class':'form-control'}),
            'notes' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'date_added_on': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'project_status': forms.Select(attrs={'class':'form-control'}),


        }
 
       
class ProjectAssignmentForm(forms.ModelForm):
    class Meta:
        model = ProjectAssignment
        fields = "__all__"
        exclude = ['project_assignment_key','client','added_by','project',]
        project_assignment = forms.ModelChoiceField(ExtendedUserModel.objects.filter(is_teammember='on'))
        widgets = {
            'message' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'project_assignment':forms.SelectMultiple()
        }
  

class TeamleaderViewForm(forms.ModelForm):
   
    class Meta:
        model = ExtendedUserModel
        fields="__all__"
        exclude =['is_telecallers','is_teamleader','is_client','is_teammember','is_staff','is_superviser','is_designer','is_dealer','is_technician','is_factory_superviser']  
        widgets ={
            'user' : forms.Select(attrs={'class':'form-control','disabled':'disabled'}),
            'blood_group' : forms.TextInput(attrs={'class':'form-control','disabled':'disabled'}),
            'employe_name' : forms.TextInput(attrs={'class':'form-control','disabled':'disabled'}),
            'phn_number' : forms.TextInput(attrs={'class':'form-control','disabled':'disabled'}),
            'address' : forms.Textarea(attrs={'class':'form-control','rows':'3','disabled':'disabled'}),
            'dob': forms.DateInput(attrs={'class': 'form-control','type': 'date','disabled':'disabled'}),

        } 

class TeamleaderEditForm(forms.ModelForm):
   
    class Meta:
        model = ExtendedUserModel
        fields="__all__"
        exclude =['is_telecallers','is_teamleader','is_client','is_teammember','is_staff','is_superviser','is_designer','is_dealer','is_technician','is_factory_superviser']  
        widgets ={
            'user' : forms.Select(attrs={'class':'form-control',}),
            'blood_group' : forms.TextInput(attrs={'class':'form-control'}),
            'employe_name' : forms.TextInput(attrs={'class':'form-control'}),
            'phn_number' : forms.TextInput(attrs={'class':'form-control'}),
            'address' : forms.Textarea(attrs={'class':'form-control','rows':'3'}),
            'dob': forms.DateInput(attrs={'class': 'form-control','type': 'date'}),

        } 