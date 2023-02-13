from django.shortcuts import redirect, render
from marketing.forms import MarketingAddForm
from .models import Marketing
import datetime
from django.utils import timezone as tz

# Create your views here.
d = tz.now() - datetime.timedelta(days=1)
def marketing(request):
    form = MarketingAddForm()
    if request.method == 'POST':
        form = MarketingAddForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('marketing')
    else:
        form = MarketingAddForm()
    
    marketing =Marketing.objects.filter(status='Fresh').order_by('-added_on')
    # marketing = Marketing.objects.filter(added_on__lt=d)
    context = {
        'form':form,
        'marketing':marketing
        
        }
    return render(request,'marketing.html',context)


    
def marketing_view(request,vid):
    qs = Marketing.objects.get(id=vid)
    form = MarketingAddForm(instance=qs)
    context = {'form':form}
    return render(request,'marketing_view.html',context)

def marketing_delete(request,did):
    qs = Marketing.objects.filter(id=did)
    qs.delete()
    return redirect('marketing')


def marketing_edit(request,eid):
    if request.method == 'POST':
        qs = Marketing.objects.get(id=eid)
        form = MarketingAddForm(request.POST,instance=qs)
        if form.is_valid():
            form.save()
            return redirect('marketing')
    else:
        qs = Marketing.objects.get(id=eid)
        form = MarketingAddForm(instance=qs)
    return render(request,'marketing_edit.html',{'form':form})


def open_marketing(request):
    open = Marketing.objects.filter(status='Open')
    context = {
        'open':open
    }
    return render(request,'openmarketing.html',context)



def success_marketing(request):
    success = Marketing.objects.filter(status='Success')
    context = {
        'success':success
    }
    return render(request,'successmarketing.html',context)


def closed_marketing(request):
    closed = Marketing.objects.filter(status='Closed')
    context = {
        'closed':closed
    }
    return render(request,'closedmarketing.html',context)




def contact_client(request):
    dy = tz.now() - datetime.timedelta(days=3)
    print("DATE:",dy)
    contact_client = Marketing.objects.filter(added_on=dy)
    # contact_client = Marketing.objects.all()
    print(contact_client)
    return render(request,'contact-client.html',{'contact_client':contact_client})



def contact_client1(request):
    dy = tz.now() - datetime.timedelta(days=7)
    contact_client = Marketing.objects.filter(added_on=dy)
    # contact_client = Marketing.objects.all()
    print(contact_client)
    return render(request,'contact-client1.html',{'contact_client':contact_client})



