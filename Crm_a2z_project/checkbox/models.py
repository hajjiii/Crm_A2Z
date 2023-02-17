from django.db import models

# Create your models here.

class Tag(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=50)

class Task(models.Model):
    def __str__(self):
        return self.description
    description = models.CharField(max_length=200)
    tags = models.ManyToManyField(Tag)