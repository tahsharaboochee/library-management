from django.urls import path
from django.contrib.auth.views import LoginView, LogoutView
from .views import register, home, book_list, book_detail, checkout_book, return_book, profile_view, edit_profile, save_book, delete_book

urlpatterns = [
    path('books/', book_list, name='book_list'),
    path('books/<str:id>/', book_detail, name='book_detail'),
    path('books/<str:id>/checkout/', checkout_book, name='checkout_book'),
    path('books/<str:id>/return/', return_book, name='return_book'),
    path('books/<str:id>/save/', save_book, name='save_book'),
    path('login/', LoginView.as_view(template_name='catalog/login.html'), name='login'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
    path('home/', home, name='home'),
    path('profile/', profile_view, name='profile_view'),
    path('profile/edit/', edit_profile, name='edit_profile'),
    path('register/', register, name='register'),
    path('books/<int:pk>/delete/', delete_book, name='delete_book'),
]