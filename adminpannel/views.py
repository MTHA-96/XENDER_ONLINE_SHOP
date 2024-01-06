from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.contrib.sessions.backends.db import SessionStore
from django.contrib.sessions.models import Session
from django.views.generic import CreateView,ListView,DetailView,UpdateView,DeleteView
from adminpannel.models import Categories,Subcategories,Advertisement,TempImage,Customers,Feedback,CustomerHistory,Adminlogin,MonthlyIncome
from user.models import Product,Order,OrderHistory
from django.template import loader
from PIL import Image
from datetime import datetime,date
from collections import Counter 
import io
import tempfile
import json


# Create your views here.
# ADMIN LOGIN
def dashboard(request):
	return render(request,'home.html')

class AdminLogin(CreateView):
	model = Adminlogin
	template_name = 'adminlogin.html'

	def get(self,request):
		msg = False
		return render(request,self.template_name,{'notice':msg}) 


	def post(self,request,*args,**kwargs):
		if request.method == 'POST':
			print('min thiha aung')
			username = request.POST.get('name')
			psswd = request.POST.get('password')
			filter_data = self.model.objects.filter(name=username,password=psswd)
			filter_count = filter_data.count()
			if filter_count > 0 :
				msg = False
				request.session['admin'] = username
				get_session = request.session.get('admin')
				print(get_session)
				return redirect('/administrator/dashboard/')
			else:
				msg = True
				message = 'Username and password does not match!'
				return render(request,self.template_name,{'notice':msg,'message':message })


class AdminLogout(CreateView):
	template_name = 'adminlogin.html'

	def get(self,request):
		data = ''
		return render(request,self.template_name,{'data':data}) 

	def post(self,request,*args,**kwargs):
		adminsession = request.session.get('admin')
		if adminsession :
			request.session.flush()
		return render(request,self.template_name)



#PRODUCT CRUD 

class AddProduct(CreateView):
	cate_model = Categories.objects.all()
	subcate_model = Subcategories.objects.all()
	product_data = Product
	template_name = 'add_product.html'

	def get(self,request):
		data = {
		 'cate':self.cate_model,
		 'subcate':self.subcate_model
		}
		print(data)
		return render(request,self.template_name,data)

	def post(self,request,*args,**kwargs):
		if request.method == 'POST':
			small = request.POST.get('small')
			print(small+'This is printing')
			if small == 'on':
				small_size = True 
			else:
				small_size = False
			medium = request.POST.get('medium')
			if medium == 'on':
				medium_size = True 
			else:
				medium_size = False 
			large = request.POST.get('large')
			if large == 'on':
				large_size = True 
			else:
				large_size = False
			extra_large = request.POST.get('extra_large')
			if extra_large == 'on':
				extra_large_size = True 
			else:
				extra_large_size = False
			more_extra_large = request.POST.get('more_extra_large')
			if more_extra_large == 'on':
				more_extra_large_size = True 
			else:
				more_extra_large_size = False
			add_product = self.product_data.objects.create(
			name = request.POST.get('product_name'),
			date = request.POST.get('date'),
			detail = request.POST.get('detail'),
			remark = request.POST.get('remark'),
			s_size = small_size,
			m_size = medium_size,
			l_size = large_size,
			xl_size = extra_large_size,
			xxl_size = more_extra_large_size,
			old_price = request.POST.get('old_price'),
			new_price = request.POST.get('new_price'),
			discount = request.POST.get('discount'),
			image = request.FILES.get('fst_img'),
			l_img = request.FILES.get('sec_img'),
			r_img = request.FILES.get('trd_img'),
			f_img = request.FILES.get('fth_img')
			)

			category = request.POST.get('category'),
			subcategory = request.POST.getlist('sub_category')
			print(subcategory)
			add_product.catego.set(category)
			add_product.subcatego.set(subcategory)
			add_product.save()
			print(add_product)

			return HttpResponse('Product added successfully')

class ProductList(ListView):
	model = Product
	context_object_name = "productList"
	template_name = "product_list.html"

class ProductDetail(DetailView):
	model = Product
	context_object_name = 'productDetail'
	template_name = 'product_detail.html'

class ProductUpdate(UpdateView):
	catego = Categories.objects.all()
	subcatego = Subcategories.objects.all()
	product_data = Product
	template = loader.get_template("product_update.html")

	def get(self,request,product_id):
	    get_product = self.product_data.objects.get(pk=product_id)
	    print(get_product.image)
	    print(get_product.date_update)
	    print("This is printing image location for examples")
	    context = {
	     "product": get_product,
	     "catego":self.catego,
	     "subcatego":self.subcatego
	    }
	    return HttpResponse(self.template.render(context,request))

	def post(self,request,product_id,*args,**kwargs):
		if request.method == 'POST':
			small = request.POST.get('small')
			if small == 'on':
				small_size = True 
			else:
				small_size = False
			medium = request.POST.get('medium')
			if medium == 'on':
				medium_size = True 
			else:
				medium_size = False 
			large = request.POST.get('large')
			if large == 'on':
				large_size = True 
			else:
				large_size = False
			extra_large = request.POST.get('extra_large')
			if extra_large == 'on':
				extra_large_size = True 
			else:
				extra_large_size = False
			more_extra_large = request.POST.get('more_extra_large')
			if more_extra_large == 'on':
				more_extra_large_size = True 
			else:
				more_extra_large_size = False

			data = self.product_data.objects.get(pk=product_id)
			print(data)
			data.name = request.POST.get('product_name')
			data.date = request.POST.get('date')
			data.detail = request.POST.get('detail')
			data.remark = request.POST.get('remark')
			data.s_size = small_size
			data.m_size = medium_size
			data.l_size = large_size
			data.xl_size = extra_large_size
			data.xxl_size = more_extra_large_size
			data.old_price = request.POST.get('old_price')
			data.new_price = request.POST.get('new_price')
			data.discount = request.POST.get('discount')
			data.image = request.FILES.get('fst_img')
			data.l_img = request.FILES.get('sec_img')
			data.r_img = request.FILES.get('trd_img')
			data.f_img = request.FILES.get('fth_img')
			category = request.POST.get('category'),
			subctaegory = request.POST.getlist('sub_category')
			data.catego.set(category)
			data.subcatego.set(subcategory)	
			data.save()
			return redirect('/administrator/product_list/')

class ProductDelete(DeleteView):
	model = Product
	success_url = reverse_lazy('product_list')
	context_object_name = "product_delete"
	template_name = "product_list.html"


# BILLBOARD AND ADS CRUD

class AddAdvertisement(CreateView):
	category_object = Categories.objects.all()
	subcategory_object = Subcategories.objects.all()
	product_id = Product.objects.all()
	tempImageStore = TempImage
	advertisement = Advertisement
	template_name = "add_billboard.html"
	length = range(1,7)
	


	def get(self,request,*args,**kwargs):
		
		data = {
			"category":self.category_object,
			"subcategory": self.subcategory_object,
			"adv_id_range":self.length,
			"products":self.product_id
		}
		return render(request,self.template_name,data)

		


	def post(self,request,*args,**kwargs):
		get_adv_object = self.advertisement.objects.all()
		

		if request.method == 'POST':
			fst_cap = request.POST.get('fst_cap')
			issue_date = request.POST.get('date')
			advcard_id = request.POST.get('adv_code')
			sec_cap = request.POST.get('sec_cap')
			trd_cap = request.POST.get('trd_cap')
			fth_cap = request.POST.get('fth_cap')
			fith_cap = request.POST.get('fith_cap')
			catego = request.POST.get('category')
			subcatego = request.POST.getlist('sub_category')
			converted_id_list = [int(id_str) for id_str in subcatego]
			print("This is id list for get list ===============================================================")
			print(converted_id_list)
			subcategoid = request.POST.get('sub_category')     #this is for subctegory_name it only need id
			img = request.FILES.get('image')
			product_id = request.POST.get('product_id')
			category_name = Categories.objects.get(pk=catego)
			subctegory_name = Subcategories.objects.get(pk=subcategoid)
			


			if category_name.name == 'billboards' or category_name.name == 'sliders' or category_name.name == 'partners' or category_name.name == 'payment_methods':
				print("This is converted_id_list testing =-=-=-=-=-=-=-=-=-=-=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
				print(catego,converted_id_list[0], advcard_id)
				filter_adv_objcet = self.advertisement.objects.filter(category=catego,sub_category=converted_id_list[0],adv_id=advcard_id).count()
				if filter_adv_objcet > 0 :
					alert = True
					sending_message = "This item have already been exit!: Do You Want To Replace It!"

					imagetempstore = self.tempImageStore.objects.create(temp_image=img)
					imagetempstore.save()
					

					return render(request,self.template_name,
						{
							"warning":alert,
							"send_message": sending_message,
							"category":self.category_object,
							"subcategory":self.subcategory_object,
							"adv_id_range":self.length,
							"first_cap": fst_cap,
							"date": issue_date,
							"second_cap": sec_cap,
							"third_cap": trd_cap,
							"fourth_cap": fth_cap,
							"fifth_cap": fith_cap,
							"cate": catego,
							"subcate": converted_id_list[0],
							"product_id":product_id,
							"adv_no": advcard_id 
						})	
				else:
					alert = False
					add_adv_data = self.advertisement.objects.create(
						first_caption = fst_cap,
						date = issue_date,
						adv_id =  advcard_id,
						second_caption = sec_cap,
						third_caption = trd_cap,
						fourth_caption = fth_cap,
						fifth_caption = fith_cap,
						image = img,
						product_id = product_id
					)
					
					add_adv_data.category.set(catego)
					add_adv_data.sub_category.set(converted_id_list)
					add_adv_data.save()

					return render(request,self.template_name,{"msg":alert})

			else:
				message = True
				sending = 'Your Category must be one of them! Exp:billboards,sliders,partners,payment_methods'
				return render(request,self.template_name,
				{
					"msg":message,
					"send_message":sending,
					"category":self.category_object,
					"subcategory":self.subcategory_object,
					"adv_id_range":self.length
				})				

class AdvReplace(UpdateView):
	category_object = Categories.objects.all()
	subcategory_object = Subcategories.objects.all()
	tempImageStore = TempImage.objects.all()
	advertisement = Advertisement
	template_name = "add_billboard.html"
	length = range(1,7)



	def post(self,request):
		if request.method == 'POST':
			get_adv_id = request.POST.get('adv_id')
			get_catego = request.POST.get('cate')
			print(get_catego)
			get_subcatego = request.POST.get('subcate')
			print("This is printing subcatego from input method)))()(()((()()()()()()()((((((((()()()))))))))()()()()()()())))")
			print(get_subcatego)
			get_data = self.advertisement.objects.all()
			for data in get_data:
				for catego in data.category.all():
					for subcatego in data.sub_category.all():
						print(get_adv_id);
						print(get_catego);
						print(type(get_subcatego));
						
						if data.adv_id == int(get_adv_id) and catego.id == int(get_catego) and subcatego.id == int(get_subcatego):
							print("false True Ture")
							filtered_data = self.advertisement.objects.get(pk=data.id)
							print(filtered_data.first_caption)
							filtered_data.first_caption = request.POST.get('cap_one')
							filtered_data.date = request.POST.get('date')
							filtered_data.second_caption = request.POST.get('cap_two')
							filtered_data.third_caption = request.POST.get('cap_three')
							filtered_data.fourth_caption = request.POST.get('cap_four')
							filtered_data.fifth_caption = request.POST.get('cap_five')
							filtered_data.product_id = request.POST.get('pro_id')
							for tmp_image in self.tempImageStore:
								filtered_data.image = tmp_image.temp_image 
							filtered_data.save()
							self.tempImageStore.delete()
							return redirect('/administrator/advertisement_list/')
						else:
							message = "error founding"
		return render(request,self.template_name,
		{
			"msg":message,
			"category":self.category_object,
			"subcategory":self.subcategory_object,
			"adv_id_range":self.length
		})	

class AdvertisementList(ListView):
	model = Advertisement
	context_object_name = 'advertisement_list'
	template_name = 'billboard_list.html'

class AdvertisementDetail(DetailView):
	model = Advertisement
	context_object_name = "advertisement_detail"
	template_name = "billboard_detail.html"

class AdvertisementUpdate(UpdateView):
	category_object = Categories.objects.all()
	subcategory_object = Subcategories.objects.all()
	product_list = Product.objects.all()
	tempImageStore = TempImage
	advertisement = Advertisement
	template_name = 'billboard_update.html'
	length = range(1,7)


	def get(self,request,product_id):
		get_adv = self.advertisement.objects.get(pk=product_id)
		data = {
			"adv_data" : get_adv,
			"category" : self.category_object,
			"subcategory" : self.subcategory_object,
			"adv_id_range":self.length,
			"products": self.product_list
		}

		return render(request,self.template_name,data)

	def post(self,request,product_id,*args,**kwargs):
		get_adv = self.advertisement.objects.get(pk=product_id)
		if request.method == "POST":
			fstCap = request.POST.get('fst_cap')
			date = request.POST.get('date')
			adv_id = request.POST.get('adv_code')
			secCap = request.POST.get('sec_cap')
			trdCap = request.POST.get('trd_cap')
			fthCap = request.POST.get('fth_cap')
			fithCap = request.POST.get('fith_cap')
			img = request.FILES.get('image')
			product_list = request.POST.get('products')
			catego = request.POST.get('category')
			subcatego = request.POST.get('sub_category')
			category_name = self.category_object.get(pk=catego)
			subctegory_name = self.subcategory_object.get(pk=subcatego)



			if category_name.name == 'billboards' or category_name.name == 'sliders' or category_name.name == 'partners' or category_name.name == 'payment_methods':
				filter_adv_objcet = self.advertisement.objects.filter(category=catego,sub_category=subcatego,adv_id=adv_id).count()
				if filter_adv_objcet > 0 :
					alert = True
					sending_message = "This item have already been exit!: Do You Want To Replace It!"

					imagetempstore = self.tempImageStore.objects.create(temp_image=img)
					imagetempstore.save()
					

					return render(request,self.template_name,
						{
							"warning":alert,
							"send_message": sending_message,
							"category":self.category_object,
							"subcategory":self.subcategory_object,
							"adv_id_range":self.length,
							"first_cap": fstCap,
							"date": date,
							"second_cap": secCap,
							"third_cap": trdCap,
							"fourth_cap": fthCap,
							"fifth_cap": fithCap,
							"product_list":product_list,
							"cate": catego,
							"subcate": subcatego,
							"adv_no": adv_id  
						})	
				else:
					alert = False
					get_adv.first_caption = fstCap,
					get_adv.date = date,
					get_adv.adv_id =  adv_id,
					get_adv.second_caption = secCap,
					get_adv.third_caption = trdCap,
					get_adv.fourth_caption = fthCap,
					get_adv.fifth_caption = fithCap,
					get_adv.image = img
					get_adv.product_id = product_list
					get_adv.category.set(catego)
					get_adv.sub_category.set(subcatego)
					get_adv.save()

					return redirect('/administrator/advertisement_list/')

			else:
				message = True
				sending = 'Your Category must be one of them! Exp:billboards,sliders,partners,payment_methods'
				return render(request,self.template_name,
				{
					"msg":message,
					"send_message":sending,
					"category":self.category_object,
					"subcategory":self.subcategory_object,
					"adv_id_range":self.length
				})


class AdvertisementDelete(DeleteView):
	model = Advertisement
	success_url = reverse_lazy('advertisement_list')
	context_object_name = 'advertisement_delete'
	template_name = 'billboard_list.html'



# GETTING ORDER AND DELIVER ORDER 

def get_order_data():
		product = Product.objects.all()
		order = Order.objects.all()
		customer = Customers.objects.all()
		total_quan_data = {}
		total_price_data={}
		for customer_data in customer:
			order_filter = Order.objects.filter(customer_data_id=customer_data.id)
			total_quan = 0
			total_price = 0 
			for data_list in order_filter:
				total_quan += data_list.quantity
				total_price += data_list.price
				total_quan_data[data_list.customer_data.id] = total_quan
				total_price_data[data_list.customer_data.id] = total_price
		return {
			'product_data': product,
			'order_list': order,
			'quan_list': total_quan_data,
			'price_list': total_price_data
		}

class OrderList(ListView):
	model = Customers
	context_object_name = 'order'
	template_name = 'order.html'
	


	def get_context_data(self,*args,**kwargs):
		context = super().get_context_data(**kwargs)
		context.update(get_order_data())
		return context
	

class OrderDetail(DetailView):
	model = Customers
	context_object_name = 'detail_order'
	template_name = 'order_detail.html'

	def get_context_data(self,*args,**kwargs):
		context = super().get_context_data(**kwargs)
		context.update(get_order_data())
		return context

class SavetoHistory(CreateView):
	customer = Customers
	order = Order
	monthly_income_data = MonthlyIncome
	customer_hitory = CustomerHistory
	order_history = OrderHistory

	def get(self,request,id,*args,**kwargs):
		selected_customer = self.customer.objects.get(pk=id)
		selected_orderlist = self.order.objects.filter(customer_data_id=id)
		add_to_customerhistory = self.customer_hitory.objects.create(
			name=selected_customer.name,
			email=selected_customer.email,
			phone=selected_customer.phone,
			address=selected_customer.address,
			city=selected_customer.city,
			payment_method=selected_customer.payment_method,
			card_no=selected_customer.card_no,
			card_exp_date=selected_customer.card_exp_date,
			cvv_no=selected_customer.cvv_no,
			issue_date=selected_customer.order_date
			)
		add_to_customerhistory.save()

		# adding to annual count 
		for orderhistory in selected_orderlist:
			order_issue_month = orderhistory.issue_date.date()
			order_date_split = order_issue_month.strftime("%b")
			current_month = datetime.now()
			current_month_split = current_month.strftime("%b")
			total_amount = 0
			total_earn = 0
			if order_date_split	== current_month_split:
				get_exited_income = self.monthly_income_data.objects.get(month=order_date_split)
				print(type(get_exited_income.quantity))
				total_amount += orderhistory.quantity + int(get_exited_income.quantity)
				total_earn += orderhistory.price + get_exited_income.price
				get_exited_income.quantity = str(total_amount)
				get_exited_income.price = total_earn 
				get_exited_income.save()

			add_to_orderhistory = self.order_history.objects.create(
				product=orderhistory.product,
				size=orderhistory.size,
				quantity=orderhistory.quantity,
				price=orderhistory.price,
				product_id=orderhistory.product_id,
				issue_date=orderhistory.issue_date,
				customer_data=add_to_customerhistory
				)
			add_to_orderhistory.save()

		selected_customer.delete()
		return redirect('/administrator/history_list/')



def get_history_data():
		product = Product.objects.all()
		historyorder = OrderHistory.objects.all()
		historycustomer = CustomerHistory.objects.all()
		total_quan_data = {}
		total_price_data={}
		for customer_data in historycustomer:
			order_filter = OrderHistory.objects.filter(customer_data_id=customer_data.id)
			total_quan = 0
			total_price = 0 
			for data_list in order_filter:
				total_quan += data_list.quantity
				total_price += data_list.price
				total_quan_data[data_list.customer_data.id] = total_quan
				total_price_data[data_list.customer_data.id] = total_price
		return {
			'product_data': product,
			'history_list': historyorder,
			'quan_list': total_quan_data,
			'price_list': total_price_data
		}
		

class HistoryView(ListView):
	model = CustomerHistory
	context_object_name = 'order_customer_history'
	template_name = 'history.html'

	def get_context_data(self,*args,**kwargs):
		context = super().get_context_data(**kwargs)
		context.update(get_history_data())
		return context


class DetailHistory(DetailView):
	model = CustomerHistory
	context_object_name = 'history_detail'
	template_name = 'history_detail.html'


	def get_context_data(self,*args,**kwargs):
		context = super().get_context_data(**kwargs)
		context.update(get_history_data())
		print(context)
		return context

class DeleteHistory(DeleteView):
	model = CustomerHistory
	context_object_name = 'delete_history'
	template_name = 'history.html'
	success_url = reverse_lazy('history_view')


class DeleteHistoryWithDate(CreateView):
	data = CustomerHistory
	template_name = 'history.html'

	def post(self,request,*args,**kwargs):
		if request.method == 'POST':
			start_date = request.POST.get('startdate')
			end_date = request.POST.get('enddate')
			get_data = self.data.objects.all()
			print(get_data)
			print(start_date)
			print(end_date)

			for data in get_data:
				if data.splitdate >= start_date and data.splitdate <= end_date:
					print(data.splitdate)
					print(start_date)
					print(end_date)
					data.delete()
	
			return redirect('/administrator/history_list')		





# FEEDBACK  		
class FeedBack(ListView):
	model =  Feedback
	context_object_name =  'feedback'
	template_name = 'feedback.html'

class ReadFeedback(DeleteView):
	model = Feedback
	success_url = reverse_lazy('feedback')
	context_object_name = 'deletemessage'
	template_name = 'feedback.html'





# ADMIN DASHBOARD 
class AdminDashboard(ListView):
	model = OrderHistory
	monthly_income_model = MonthlyIncome 
	feedback_model = Feedback
	context_object_name = "dashboard_data"
	template_name = "home.html"
	current_date = datetime.now()
	cur_month = current_date.strftime("%b")
	
	

	def get_daily_sales(self):
		order_data = self.model.objects.all()
		get_monthly_count = self.monthly_income_model.objects.get(month=self.cur_month)
		data_for_areachart = self.monthly_income_model.objects.all()
		monthly_soldout_units = get_monthly_count.quantity
		monthly_income = get_monthly_count.price
		now_date = self.current_date
		today = now_date.date()
		units = 0
		price = 0 
		chart_data = []
		counting_ids = {}
		maximun_seller_count_id = []
		maximun_seller_count_value = []


			
		for orderlist in order_data:
			if (orderlist.issue_date.date() == today):
				units += orderlist.quantity
				price += orderlist.price

		for areachrat in data_for_areachart:
			chart_data.append(int(areachrat.price))

		current_year = self.current_date.strftime('%Y')
		current_month = self.current_date.strftime('%m')	
		for order_list in order_data:
			order_year = order_list.issue_date.strftime('%Y') 
			order_month = order_list.issue_date.strftime('%m')
			if order_year == current_year and order_month == current_month:
				if order_list.product in counting_ids:
					counting_ids[order_list.product ] += order_list.quantity
				else:
					counting_ids[order_list.product ] = order_list.quantity

				
		sorted_data = sorted(counting_ids.items(), key=lambda x: x[1], reverse=True)

		sorted_data_dict = dict(sorted_data)

		choosen_three = dict(list(sorted_data_dict.items())[:3])

		for key,value in choosen_three.items():
			maximun_seller_count_id.append(key)
			maximun_seller_count_value.append(value)



		def  reading_feedback(fbmodel):
			get_feedback_data = fbmodel
			count_feedback = get_feedback_data.count()
			data = {
				"getfbk": get_feedback_data,
				"countfbk": count_feedback
			}

			return data


		feedback_data = reading_feedback(self.feedback_model.objects.all())
		print(type(feedback_data))
		
		
		return {
			"unit":units,
			"price":price,
			'm_unit':monthly_soldout_units,
			'm_price':monthly_income,
			'area_chart':chart_data,
			'bestseller_item': json.dumps(maximun_seller_count_id),
			'bestseller_value': maximun_seller_count_value,
			'feedback':feedback_data
			
		}


	def get_context_data(self,*args,**kwargs):
		context = super().get_context_data(**kwargs)
		context.update(self.get_daily_sales())
		return context













	

