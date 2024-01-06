from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from django.template import loader
from django.urls import reverse
from django.contrib.sessions.backends.db import SessionStore
from django.contrib.sessions.models import Session
from django.utils import timezone
from user.models import Product,Userlogin,TempOrder,Order
from adminpannel.models import Categories,Subcategories,Customers,Advertisement,Feedback
import decimal



# Create your views here.
# PAGES VIEWING
def index(request):
    product= Product.objects.all()
    advertisement =  Advertisement.objects.all()
    template = loader.get_template('index.html')
    context = {
         'product_list':product,
         'adv_list':advertisement
    }
    return HttpResponse(template.render(context,request))

def men(request):
    product = Product.objects.all()
    advertisement =  Advertisement.objects.all()
    template = loader.get_template('men.html')
    sub_catego = Subcategories.objects.all()
    context = {
        'men_product_list':product,
        'adv_list': advertisement
    }
    return HttpResponse(template.render(context,request))

def women(request):
    product = Product.objects.all()
    advertisement = Advertisement.objects.all()
    template = loader.get_template('women.html')
    context = {
        'wm_product_list':product,
        'adv_list': advertisement
    }
    return HttpResponse(template.render(context,request))

def kid(request):
    product = Product.objects.all()
    advertisement = Advertisement.objects.all()
    template = loader.get_template('kid.html')
    context = {
        'kid_product_list':product,
        'adv_list': advertisement
    }
    return HttpResponse(template.render(context,request))

def about(request):
    product = Product.objects.all()
    advertisement = Advertisement.objects.all()
    template = loader.get_template('about.html')
    context = {
        'about_data': product,
        'adv_list':advertisement
    }
    return HttpResponse(template.render(context,request))

def contact(request):
    product = Product.objects.all()
    advertisement = Advertisement.objects.all()
    session = request.session.get('username')
    if session != None:
        check_mail = Userlogin.objects.filter(email=session)
    else:
        check_mail='empty'
        
    template = loader.get_template('contact.html')
    context = {
        'contact_data': product,
        'email':check_mail,
        'adv_list':advertisement
    
    }
    return HttpResponse(template.render(context,request))

# PRODUCT DETAILS
def detail_product(request,product_id):
    product = Product.objects.get(pk=product_id)
    template = loader.get_template('detail.html')
    context = {
        'product_detail':product
    }
    return HttpResponse(template.render(context,request))

def login(request):
    return render(request,'login.html')


# USER LOGIN
def userlogin(request):
    if request.method == 'POST':
        msg = ""
        email = request.POST['email_input']
        password = request.POST['password_input']
        userData = Userlogin.objects.filter(email=email,first_password=password).count()
        if userData > 0:
            msg = "Login Success"
            request.session['username'] = email
            # SET SESSION
            return render(request,'loginsuccess.html',{"message":msg})
            
           
        else:
           msg = "Your email and password does not match!Please try again"
           return render(request,'login.html',{"message":msg,"error":True})
    else:
        return render(request, 'adminlogin.html')

def userlogout(request):
    usersession = request.session.get('username')
    if usersession:
        request.session.flush()
        return redirect('/user/clientlogin/')

def signup(request):
    return render(request,'signup.html')

def usersignup(request):
    accounts = Userlogin.objects.all()
    if request.method == 'POST':
        first_name = request.POST.get('fstname')
        last_name = request.POST.get('lstname')
        email = request.POST.get('mail')
        fst_password = request.POST.get('first_password')
        sec_password = request.POST.get('second_password')

        for acc in accounts:
            mail = acc.email
            if(mail == email):
                msg = "This email is already have an accounts!Please use another one"
                return render(request,'signup.html',{"message":msg,"error_mail":True})
            else:
                if(fst_password == sec_password):
                    signup = Userlogin.objects.create(
                        firstname = first_name,
                        lastname = last_name,
                        email = email,
                        first_password = fst_password,
                        second_password = sec_password 
                        )
                    signup.save()
                    return redirect('/user/signupsuccess/')
                else:
                    msg="Dose not match password!"
                    return render(request,'signup.html',{"message":msg,"error_pass":True})
        
    else:
        return redirect('/user/signup/')


def signupsuccess(request):
    return render(request,'successssignup.html')


def Addtocard(request):
    username = request.session.get('username')

    if request.method == "POST":
        if not username :
            return redirect('/user/clientlogin/')

        else:
            totalpriceforeachproduct = 0
            size = request.POST.get('selector')
            quan = int(request.POST.get('quantity'))
            p_id = request.POST.get('product_id')
            product = Product.objects.get(pk=p_id)
            unitprice = product.new_price
            totalpriceforeachproduct += quan * unitprice
            addtotemporder = TempOrder.objects.create(
                name = product.name,
                size = size,
                quan = quan,
                price = totalpriceforeachproduct,
                product_id = p_id,
                usersessionname = username
                )
            addtotemporder.save()
            msg = "Finished adding to basket"
            finish = True
            url = reverse('detail',args=[p_id])
            return redirect(url)


def viewcard(request):
    usersession = request.session.get('username')
    temporder = TempOrder.objects.filter(usersessionname=usersession)
    order_count = temporder.count()
    print(order_count)
    product = Product.objects.all()
    template = loader.get_template('card.html')
    totalquan = 0
    totalprice = 0 
    for order_data in temporder:
        totalquan += order_data.quan
        totalprice += order_data.price 

    
    context = {
        'order_list':temporder,
        'product':product,
        'total_quan':totalquan,
        'total_price':totalprice,
        'is_empty_card':order_count,

    }
    return HttpResponse(template.render(context,request))

def editcard(request,order_id):
    if order_id == None:
        order_id = 0
    temp_order_list = TempOrder.objects.get(pk=order_id)
    product = Product.objects.get(pk=temp_order_list.product_id)
    template = loader.get_template('editcard.html')
    context = {
        "temp_order":temp_order_list,
        "product_list":product
    }
    return HttpResponse(template.render(context,request))

def updateorder(request,update_id):
    totalpriceforeachproduct = 0 
    if request.method == 'POST':
        temp_order = TempOrder.objects.get(pk=update_id)
        temp_order.size = request.POST.get('selector')
        temp_order.quan = int(request.POST.get('quantity')) 
        product = Product.objects.get(pk=temp_order.product_id)
        totalpriceforeachproduct += temp_order.quan * product.new_price
        temp_order.price = totalpriceforeachproduct
        temp_order.save()
        return redirect('/user/card/')
        
def deleteorder(request,del_id):
    temp_order = TempOrder.objects.get(pk=del_id)
    temp_order.delete()
    return redirect('/user/card/')


def checkout(request):
    usersession = request.session.get('username')
    if request.method == 'POST':
        get_order = TempOrder.objects.filter(usersessionname=usersession)
        count_order = get_order.count()
        total_quan = 0
        total_price = 0
        for order in get_order:
            total_quan += order.quan
            total_price += order.price
        template = loader.get_template('payment.html')
        context= {
            "order_list":get_order,
            "order_count":count_order,
            "total_q":total_quan,
            "total_p":total_price
            
        }

        return HttpResponse(template.render(context,request))



def payment(request):
    usersession = request.session.get('username')
    if request.method == 'POST':
        name = request.POST.get('fst_name') + ' '+request.POST.get('lst_name')
        email = request.POST.get('email')
        phone = request.POST.get('country_code') + request.POST.get('phone')
        address = request.POST.get('address')
        city = request.POST.get('city')
        payment_method = request.POST.get('payment')
        card_no = request.POST.get('card_no')
        card_exp_date = request.POST.get('expire')
        cvv_no = request.POST.get('cvv')

        customer = Customers.objects.create(
            name = name ,
            email = email,
            phone = phone,
            address = address,
            city = city,
            payment_method = payment_method,
            card_no = card_no,
            card_exp_date = card_exp_date,
            cvv_no  = cvv_no
            )

        customer.save()
        
        get_order_list = TempOrder.objects.filter(usersessionname=usersession)
        for order_list in get_order_list:
            order = Order.objects.create(
                product=order_list.name,
                size=order_list.size,
                quantity= order_list.quan,
                price= order_list.price,
                product_id= order_list.product_id,
                issue_date=order_list.userordertime,
                customer_data= customer
                )
            order.save()

        get_order_list.delete()
        return redirect("/user/signupsuccess/")



def feedback(request):
    if request.method == 'GET':
        send_mail = Feedback.objects.create(
            name = request.GET.get('name'),
            email = request.GET.get('email'),
            comment= request.GET.get('comment')
            )

        send_mail.save()

        return redirect('/user/contact/')


def search_data(get_data):
    get_subcatego = Subcategories.objects.all()
    subcatego_no = []
    for data in get_subcatego:
        if get_data in data.name:
            subcatego_no.append(data.id)

    product_list = []
    for i in subcatego_no:
        print(i)
        get_product = Product.objects.filter(subcatego=i)
        product_list.append(get_product)

    context = {
                'products' : product_list,
                'search_by_subcategory':True
            }
    return context


def search(request):
    products = Product
    template = loader.get_template('search.html')
    if request.method == 'GET':
        qs = request.GET.get('search_query')
        if qs == 'men' or qs == 'man' or qs == 'male':
            return redirect('/user/men/')
        elif qs == 'women' or qs == 'woman' or qs == 'female':
            return redirect('/user/women/')
        elif qs == 'children' or qs == 'child' or qs == 'kid' or qs == 'kids' :
            return redirect('/user/kid/')  
        elif 'new' in qs :
            return redirect('/user/#new_arrival')
        elif  qs == 'shirt' or  qs == 'shirts' or qs == 'jersey':
            return HttpResponse(template.render(search_data('shirt'),request))
        elif qs == 'pants'or qs == 'pant' or qs == 'trouser' or qs == 'trousers' or qs == 'bottoms' or qs == 'bottom':
            return HttpResponse(template.render(search_data('pants'),request))
        elif qs == 'undwares' or qs == 'underware' or qs == 'innerware' or qs == 'innerwares' or qs == 'panties' or qs == 'panty' or qs == 'knickers' or qs == 'knicker' or qs == 'breeks':
            return HttpResponse(template.render(search_data('underwares'),request))
        elif qs == 'shoes' or qs == 'shoe':
            return  HttpResponse(template.render(search_data('shoes'),request))

        else:
            context = {'text' : "Found Nothing ", 'search_by_subcategory' : False }
            return HttpResponse(template.render(context,request))
































    
    

    




    












            








    





    

    

    

