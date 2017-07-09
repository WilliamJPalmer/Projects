from django.shortcuts import render, HttpResponse, redirect

def index(request):
    return render(request, 'surFormApp/index.html')

def surveyProcess(request):
    if 'count' in request.session:
        pass
    else:
        request.session['count']=0

    if request.method == 'POST':
        request.session['name'] = request.POST['name']
        request.session['location'] = request.POST['location']
        request.session['language'] = request.POST['language']
        request.session['comments'] = request.POST['comments']
        print request.session['name']
        print request.session['location']
        print request.session['language']
        print request.session['comments']
        request.session['count']+=1
        return redirect('/surveyDone')


def surveyDone(request):
    return render(request, 'surFormApp/results.html')

# Create your views here.
