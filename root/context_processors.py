from user.models import	TempOrder
from adminpannel.models import Adminlogin,Feedback


def vieworderquantity(request):
    usersession = request.session.get('username')
    temporder = TempOrder.objects.filter(usersessionname=usersession).count()
    return {'temporder_data':temporder, 'session':usersession}


def viewprofile(request):
    adminsession = request.session.get('admin')
    if adminsession == None:
        admin = 'no one'
        return {'adminaccounts':admin }
    else:
        admin = Adminlogin.objects.get(name=adminsession)
        return {'adminaccounts':admin }
       
def viewmessagecount(request):
    count_feedback = Feedback.objects.all().count()
    return {'feedback_count': count_feedback }




