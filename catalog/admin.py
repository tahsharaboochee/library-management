from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from .models import Book, Circulation, UserBook
from django.contrib import admin
from .models import Book
from django.shortcuts import render, redirect
from .forms import BookFetchForm
import requests

# Customizing the admin for User model
class UserAdmin(BaseUserAdmin):
    # Add or modify the admin options here
    list_display = BaseUserAdmin.list_display + ('date_joined',)
    list_filter = BaseUserAdmin.list_filter + ('groups',)

# Before registering the new admin, unregister the old one if it has been registered
admin.site.unregister(User)
admin.site.register(User, UserAdmin)

# Custom admin for the Book model
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'isbn', 'publication_year')
    search_fields = ('title', 'author', 'isbn')

    def get_urls(self):
        from django.urls import path
        urls = super().get_urls()
        my_urls = [
            path('fetch-book/', self.admin_site.admin_view(self.fetch_book), name='fetch-book'),
        ]
        return my_urls + urls

    def fetch_book(self, request):
        if request.method == 'POST':
            form = BookFetchForm(request.POST)
            if form.is_valid():
                identifier = form.cleaned_data['identifier']
                response = requests.get(f'https://www.googleapis.com/books/v1/volumes?q=isbn:{identifier}')
                data = response.json()
                for item in data['items']:
                    book_data = item['volumeInfo']
                    Book.objects.create(
                        title=book_data.get('title'),
                        author=", ".join(book_data.get('authors', [])),
                        isbn=identifier,
                        publication_year=book_data.get('publishedDate', '').split('-')[0]
                    )
                self.message_user(request, "Book added successfully.")
                return redirect('admin:catalog_book_changelist')
        else:
            form = BookFetchForm()
        return render(request, 'admin/fetch_book.html', {'form': form})


admin.site.register(Book, BookAdmin)

# Admin configuration for the Circulation model
@admin.register(Circulation)
class CirculationAdmin(admin.ModelAdmin):
    list_display = ('book_id', 'user', 'checkout_date', 'return_date', 'reserved')
    list_filter = ('user', 'reserved')

# Admin configuration for the UserBook model
@admin.register(UserBook)
class UserBookAdmin(admin.ModelAdmin):
    list_display = ['book_title', 'user', 'isbn']
    search_fields = ['book_title', 'isbn']


if User in admin.site._registry:
    admin.site.unregister(User)