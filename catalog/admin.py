from django.contrib import admin
from .models import Book
from .models import Circulation

@admin.register(Circulation)
class CirculationAdmin(admin.ModelAdmin):
    list_display = ('book_id', 'user', 'checkout_date', 'return_date', 'reserved')
    list_filter = ('user', 'reserved')
@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'isbn', 'publication_year')
    search_fields = ('title', 'author', 'isbn')
