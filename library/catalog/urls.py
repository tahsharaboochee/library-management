from django.urls import path
from django.contrib.auth.views import LoginView, LogoutView
from .views import register, home, book_list, book_detail

urlpatterns = [
    path('home/', home, name='home'),
    path('register/', register, name='register'),
    path('login/', LoginView.as_view(template_name='catalog/login.html'), name='login'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
    path('books/', book_list, name='book_list'),
    path('books/<int:pk>/', book_detail, name='book_detail'),
]