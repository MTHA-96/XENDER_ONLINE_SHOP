from django.urls import path 
from adminpannel import views

urlpatterns = [
	path('',views.AdminLogin.as_view(),name='login'),

	path('adminlogout/',views.AdminLogout.as_view(),name='adminlogout'),

	path('add_product/',views.AddProduct.as_view(),name='add_product'),

	path("product_list/",views.ProductList.as_view(),name='product_list'),

	path('<int:pk>',views.ProductDetail.as_view(),name='product_detail'),

	path('<int:product_id>/product_update/',views.ProductUpdate.as_view(),name='product_update'),

	path('<int:pk>/product_delete/',views.ProductDelete.as_view(),name='product_delete'),

	path('add_advertisement/',views.AddAdvertisement.as_view(),name='adv_add'),

	path('replacement/',views.AdvReplace.as_view(),name='replacement'),

	path('advertisement_list/',views.AdvertisementList.as_view(),name='advertisement_list'),

	path('<int:pk>/advertisement_detail/',views.AdvertisementDetail.as_view(),name='advertisement_detail'),

	path('<int:product_id>/advertisement_update/', views.AdvertisementUpdate.as_view(), name='advertisement_update'),

	path('<int:pk>/advertisement_delete/',views.AdvertisementDelete.as_view(), name='advertisement_delete'),

	path('order_list/',views.OrderList.as_view(),name='order_list'),

	path('<int:pk>/order_detail',views.OrderDetail.as_view(),name='order_detail'),

	path('<int:id>/save_to_history/',views.SavetoHistory.as_view(),name='save_to_history'),

	path('history_list/',views.HistoryView.as_view(),name='history_view'),

	path('<int:pk>/history_detail/',views.DetailHistory.as_view(),name='history_detail'),

	path('<int:pk>/history_delete/',views.DeleteHistory.as_view(),name='history_delete'),

	path('delete_history_withdate/',views.DeleteHistoryWithDate.as_view(),name='delete_history_withdate'),

	path('feedback/',views.FeedBack.as_view(),name='feedback'),

	path('<int:pk>/feedback_delete/',views.ReadFeedback.as_view(),name='feedback_delete'),

	path('dashboard/',views.AdminDashboard.as_view(),name='dashboard'),

	path('feedbackview/',views.ReadFeedback.as_view(),name='feedbackview')



]

