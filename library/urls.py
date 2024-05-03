from django.contrib import admin
from django.urls import path, include
from django.contrib.auth.views import LoginView, LogoutView
from catalog.views import book_list, book_detail, checkout_book, return_book, profile_view, edit_profile, register, home, save_book, delete_book, index
urlpatterns = [
    path('admin/', admin.site.urls),
    path('books/', book_list, name='book_list'),
    path('books/<slug:book_id>/', book_detail, name='book_detail'),
    path('books/<slug:book_id>/checkout/', checkout_book, name='checkout_book'),
    path('books/<slug:pk>/return/', return_book, name='return_book'),
    path('books/<str:id>/save/', save_book, name='save_book'),
    path('home/', home, name='home'),
    path('index/', index, name='index'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(next_page='index'), name='logout'),
    path('profile/', profile_view, name='profile_view'),
    path('profile/edit/', edit_profile, name='edit_profile'),
    path('register/', register, name='register'),
    path('books/<slug:pk>/delete/', delete_book, name='delete_book'),  # Changed from <int:pk> to <slug:pk>
]