from django.urls import path 
from user import views

urlpatterns = [
    path('',views.index,name="index"),

    path('men/',views.men,name='men'),

    path('women/',views.women,name='women'),

    path('kid/',views.kid,name='kid'),

    path('about/',views.about,name='about'),

    path('contact/',views.contact,name='contact'),

    path('<int:product_id>/detail/',views.detail_product,name='detail'),

    path('clientlogin/',views.login,name='clientlogin'),

    path('userlogin/',views.userlogin,name='userlogin'),

    path('logout/',views.userlogout,name='logout'),

    path('signup/',views.signup,name='signup'),

    path('usersignup/',views.usersignup,name='usersingup'),

    path('signupsuccess/',views.signupsuccess,name='signupsuccess'),

    path('addtocard/',views.Addtocard,name='addtocard'),

    path('card/',views.viewcard,name='viewcard'),

    path('<int:order_id>/editcard/',views.editcard,name='editcard'),

    path('<int:update_id>/updateorder/',views.updateorder,name='updateorder'),

    path('<int:del_id>/deleteorder/',views.deleteorder,name='deleteorder'),

    path('checkout/',views.checkout,name='checkout'),

    path('payment/',views.payment,name='payment'),

    path('feedback/',views.feedback,name='feedback'),

    path('search/',views.search,name='search'),

]