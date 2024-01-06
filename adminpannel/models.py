from django.db import models
from django.utils import timezone



# Create your models here.

class Adminlogin(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField(max_length=254)
    password = models.CharField(max_length=50)
    role = models.CharField(max_length=50)

    class Meta:
        db_table = 'adminlogin'
        verbose_name_plural='Adminlogin'

    def __unicode__(self):
        return self.name

class Categories(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        db_table = 'categories'
        verbose_name_plural = 'Categories'
    
    def __unicode__(self):
        return self.name

class Subcategories(models.Model):
    name = models.CharField(max_length=50)
    
    class Meta:
        db_table = 'sub_categories'
        verbose_name_plural = 'Sub_categories'

    def __unicode__(self):  
        return self.name

class Customers(models.Model):
    name = models.CharField(max_length=50)
    email= models.EmailField(max_length=256)
    phone = models.CharField(max_length= 20)
    address = models.CharField(max_length=256)
    city = models.CharField(max_length=30)
    payment_method = models.CharField(max_length=25)
    card_no = models.CharField(max_length=20)
    card_exp_date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)
    cvv_no = models.CharField(max_length=20)
    order_date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)

    class Meta:
        db_table = 'customers'
        verbose_name_plural = 'Customers'

    def __unicode__(self):
        return self.name 

class Feedback(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField(max_length=256)
    comment = models.CharField(max_length=256)
    date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)

    class Meta:
        db_table = 'feedback'
        verbose_name_plural='Feedback'

    def __unicode__(self):
        return self.name


class Advertisement(models.Model):
    first_caption = models.CharField(max_length=100)
    date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)
    product_id = models.IntegerField(default=0)
    adv_id = models.IntegerField()
    second_caption = models.CharField(max_length=100)
    third_caption = models.CharField(max_length=100)
    fourth_caption = models.CharField(max_length=100)
    fifth_caption = models.CharField(max_length=100)
    category = models.ManyToManyField(Categories,verbose_name='category')
    sub_category = models.ManyToManyField(Subcategories,verbose_name='sub_category')
    image = models.ImageField(upload_to='static/images/billboards&others/', default=None, null=True,blank=True)



    class Meta:
        db_table = 'advertisement'
        verbose_name_plural = 'Advertisements'

    def __unicode__(self):
        return self.first_caption


    @property
    def date_update(self):
        getdatetime = self.date
        datetimetodate = getdatetime.date()
        split_date = datetimetodate.strftime("%Y-%m-%d")
        return split_date



class TempImage(models.Model):
    temp_image = models.ImageField(upload_to='static/images/billboards&others/',default=None, null=True,blank=True)


    class Meta:
        db_table = 'tempimage'
        verbose_name_plural = 'Tempimage'


def date(date):
    getdatetime = date
    datetimetodate = getdatetime.date()
    split_date = datetimetodate.strftime("%Y-%m-%d")
    return split_date

class CustomerHistory(models.Model):
    name = models.CharField(max_length=50)
    email= models.EmailField(max_length=256)
    phone = models.CharField(max_length= 20)
    address = models.CharField(max_length=256)
    city = models.CharField(max_length=30)
    payment_method = models.CharField(max_length=25)
    card_no = models.CharField(max_length=20)
    card_exp_date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)
    cvv_no = models.CharField(max_length=20)
    issue_date = models.DateTimeField(auto_now=False,auto_now_add=False,null=True,blank=True,default=timezone.now)

    class Meta:
        db_table = 'customerhistory'
        verbose_name_plural = 'customerhistory'

    def __unicode__(self):
        return self.name 

    @property
    def splitdate(self):
        dateFunction = date(self.issue_date)
        return dateFunction


class MonthlyIncome(models.Model):
    month = models.CharField(max_length=20)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.CharField(max_length=10)

    class Meta:
        db_table = 'monthlyincome'
        verbose_name_plural = 'monthlyincome'

    def __unicode__(self):
        return self.month








    

