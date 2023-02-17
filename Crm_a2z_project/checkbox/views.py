from django.shortcuts import render, get_object_or_404,redirect
from .forms import TaskForm
from .models import Task






def add_task(request):
    form = TaskForm()
    if request.method == 'POST':
        form = TaskForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('task')
    else:
        form = TaskForm()
    context = {
        'form':form,        
        }
    return render(request,'task.html',context)


def edit_task(request, task_id):
    task = get_object_or_404(Task, pk=task_id)
    if request.method == 'POST':
        form = TaskForm(request.POST, instance=task)
        if form.is_valid():
            form.save()
        return redirect('task')
    else:
        form = TaskForm(instance=task)
    return render(request, 'edit_task.html', {'form': form})