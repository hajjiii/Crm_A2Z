from django import forms
from .models import Marketing

class MarketingAddForm(forms.ModelForm):
    class Meta:
        model = Marketing
        fields = '__all__'
        exclude = ['added_on']
        widgets ={
            'name' : forms.TextInput(attrs={'class':'form-control'}),
            'phoneno1' : forms.TextInput(attrs={'class':'form-control'}),
            'phoneno2' : forms.TextInput(attrs={'class':'form-control'}),
            'email' : forms.EmailInput(attrs={'class':'form-control'}),
            'business_category' : forms.Select(attrs={'class':'form-control'}),
            'business_name' : forms.TextInput(attrs={'class':'form-control'}),
            'status' : forms.Select(attrs={'class':'form-control'}),


        } 