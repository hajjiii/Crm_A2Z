from django.db import models

# Create your models here.



class Category(models.Model):
    name = models.CharField(max_length=30,blank=True,null=True)

    def __str__(self):
        return self.name

class Marketing(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=50,blank=False,null=False)
    phoneno1 = models.CharField(max_length=12, null=False, blank=False)
    phoneno2 = models.CharField(max_length=12, null=True, blank=True)
    email = models.EmailField(blank=True,null=True)
    business_category = models.ForeignKey(Category,on_delete=models.SET_NULL, blank=True, null=True)
    business_name = models.CharField(max_length=50,blank=False,null=False)
    added_on = models.DateField(auto_now_add=True,blank=False,null=False)
    STATUS_CHOICES = (
    ("Fresh", "Fresh"),
    ("Open", "Open"),
    ("Success", "Success"),
    ("Closed", "Closed"),
)
    status = models.CharField(max_length = 20,choices=STATUS_CHOICES,default='Fresh')



