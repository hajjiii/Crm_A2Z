from django.urls import path
from . import views

urlpatterns = [
    path('',views.add_task,name='task'),
    path('task-edit/<int:task_id>',views.edit_task,name='edit'),

    
]
