from django.contrib import admin
from adminpannel.models import Adminlogin,Categories,Subcategories
from user.models import Userlogin,Product

class ProductListD(admin.ModelAdmin):
    list_display = ['id','name','date','detail','remark','s_size','m_size','l_size','xl_size','xxl_size','old_price','new_price','discount','image','f_img','l_img','r_img']

# Register your models here.
admin.site.register(Adminlogin)
admin.site.register(Categories)
admin.site.register(Subcategories)
admin.site.register(Userlogin)
admin.site.register(Product,ProductListD)
