from django.urls import path
from django.contrib.auth.views import LoginView, LogoutView
from .views import register, home, book_list, book_detail, checkout_book, return_book

urlpatterns = [
    path('home/', home, name='home'),
    path('register/', register, name='register'),
    path('login/', LoginView.as_view(template_name='catalog/login.html'), name='login'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
    path('books/', book_list, name='book_list'),
    path('books/<int:pk>/', book_detail, name='book_detail'),
    path('books/<str:id>/checkout/', checkout_book, name='checkout_book'),
    path('books/<str:id>/return/', return_book, name='return_book'),
]