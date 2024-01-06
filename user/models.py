from django.db import models
from django.utils import timezone
from adminpannel.models import Categories,Subcategories,Customers,CustomerHistory

# Create your models here.
class Userlogin(models.Model):
    firstname = models.TextField(max_length=50)
    lastname = models.TextField(max_length=50)
    email = models.EmailField(max_length=254)
    first_password = models.CharField(max_length=50)
    second_password = models.CharField(max_length=50)


    class Meta:
        db_table = 'userlogin'
        verbose_name_plural='Userlogin'
    def __unicode__(self):
        return self.firstname


class Product(models.Model):
    name = models.CharField(max_length=50)
    date = models.DateTimeField(auto_now=False, auto_now_add=False,null=True,blank=True,default=timezone.now)
    detail= models.TextField()
    remark = models.TextField()
    s_size = models.BooleanField(max_length=50)
    m_size = models.BooleanField(max_length=50)
    l_size = models.BooleanField(max_length=50)
    xl_size = models.BooleanField(max_length=50)
    xxl_size = models.BooleanField(max_length=50)
    old_price = models.DecimalField(max_digits=9, decimal_places=2)
    new_price = models.DecimalField(max_digits=9, decimal_places=2)
    discount = models.IntegerField()
    image = models.ImageField(upload_to='static/images/products/', default=None, null=True, blank=True)
    l_img = models.ImageField(upload_to='static/images/products/', default=None, null=True, blank=True)
    r_img = models.ImageField(upload_to='static/images/products/', default=None, null=True, blank=True)
    f_img = models.ImageField(upload_to='static/images/products/', default=None, null=True, blank=True)
    catego = models.ManyToManyField(Categories, verbose_name="category")
    subcatego = models.ManyToManyField(Subcategories, verbose_name="category")

    class Meta:
        db_table = 'product'
        verbose_name_plural = "Product"
    
    def __unicode__(self):
        return self.name


    @property
    def date_update(self):
        get_date_time = self.date
        date_time_to_date = get_date_time.date()
        issue_date = date_time_to_date.strftime("%Y-%m-%d")
        return issue_date

    


class TempOrder(models.Model):
    name = models.CharField(max_length=50)
    size = models.CharField(max_length=50)
    quan = models.IntegerField()
    price = models.DecimalField(max_digits=9,decimal_places=2)
    product_id = models.IntegerField()
    userordertime = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)
    usersessionname = models.EmailField(max_length=254)
    

    class Meta:
        db_table = 'tem_order'
        verbose_name_plural = 'Temp_order'

    def __unicode__(self):
        return self.name


    @property
    def delete_order_expire(self):
        get_expire = self.userordertime
        date_split = get_expire.date()
        expire_date = date_split.strftime('%d-%m-%y')
        current_timezone = timezone.now()
        current_date_split =  current_timezone.date()
        current_date = current_date_split.strftime('%d-%m-%y')
        if(expire_date < current_date):
            self.delete()

    @property
    def unit_price(self):
        actual_price = self.price
        actual_quan = self.quan
        unit_price = actual_price/actual_quan
        return unit_price
    



class Order(models.Model):
    customer_data = models.ForeignKey(Customers,on_delete=models.CASCADE,default=None)
    product = models.CharField(max_length=50)
    size = models.CharField(max_length=50)
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=9,decimal_places=2)
    product_id= models.IntegerField()
    issue_date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)

    class Meta:
        db_table = 'order'
        verbose_name_plural = 'Order'

    def __unicode__(self):
        return self.name
        


class OrderHistory(models.Model):
    customer_data = models.ForeignKey(CustomerHistory,on_delete=models.CASCADE,default=None)
    product = models.CharField(max_length=50)
    size = models.CharField(max_length=50)
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=9,decimal_places=2)
    product_id= models.IntegerField()
    issue_date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)

    class Meta:
        db_table = 'orderhistory'
        verbose_name_plural = 'orderhistory'

    def __unicode__(self):
        return self.name
        














