from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView, LogoutView
from .forms import RegisterForm
from .models import Transaction, Book
from .forms import BookForm
import requests
from .models import Circulation
from datetime import date
from django.db import models

def book_detail(request, pk):
    book = get_object_or_404(Book, pk=pk)
    return render(request, 'catalog/book_detail.html', {'book': book})


def book_list(request):
    query = request.GET.get("q", "")
    title_filter = request.GET.get("title", "")
    author_filter = request.GET.get("author", "")
    isbn_filter = request.GET.get("isbn", "")

    books = Book.objects.all()  # Start with all books

    if query:
        books = books.filter(
            models.Q(title__icontains=query) | 
            models.Q(author__icontains=query) | 
            models.Q(isbn__icontains=query)
        )

    if title_filter:
        books = books.filter(title__icontains=title_filter)
    if author_filter:
        books = books.filter(author__icontains=author_filter)
    if isbn_filter:
        books = books.filter(isbn__icontains=isbn_filter)

    return render(request, 'catalog/book_list.html', {'books': books, 'query': query, 'title': title_filter, 'author': author_filter, 'isbn': isbn_filter})


def fetch_books(query):
    """
    Fetch books from the Google Books API based on a search query.
    """
    url = f"https://www.googleapis.com/books/v1/volumes?q={query}"
    response = requests.get(url)
    data = response.json()

    # Process the API response
    books = []
    for item in data.get("items", []):
        volume_info = item.get("volumeInfo", {})
        books.append({
            'id': item.get('id'),
            'title': volume_info.get("title"),
            'authors': volume_info.get("authors", []),
            'isbn': next((id['identifier'] for id in volume_info.get('industryIdentifiers', []) if id['type'] == 'ISBN_13'), 'N/A'),
            'publishedDate': volume_info.get("publishedDate", 'N/A'),
            'description': volume_info.get("description", "No description available"),
        })
    return books

def book_list(request):
    query = request.GET.get("q", "Python")  # Default search query
    books = fetch_books(query)
    return render(request, 'catalog/book_list.html', {'books': books, 'query': query})

def book_detail(request, id):
    """
    Fetch and display a single book by its Google Books ID.
    """
    url = f"https://www.googleapis.com/books/v1/volumes/{id}"
    response = requests.get(url)
    data = response.json()

    volume_info = data.get("volumeInfo", {})
    book = {
        'title': volume_info.get("title"),
        'authors': volume_info.get("authors", []),
        'isbn': next((id['identifier'] for id in volume_info.get('industryIdentifiers', []) if id['type'] == 'ISBN_13'), 'N/A'),
        'publishedDate': volume_info.get("publishedDate", 'N/A'),
        'description': volume_info.get("description", "No description available"),
    }

    return render(request, 'catalog/book_detail.html', {'book': book})


def checkout_book(request, pk):
    book = get_object_or_404(Book, pk=pk)
    if request.method == 'POST':
        Transaction.objects.create(book=book, user=request.user, transaction_type="checkout")
        return redirect('book_detail', pk=pk)

    return render(request, 'catalog/checkout.html', {'book': book})


def return_book(request, pk):
    book = get_object_or_404(Book, pk=pk)
    if request.method == 'POST':
        Transaction.objects.create(book=book, user=request.user, transaction_type="return")
        return redirect('book_detail', pk=pk)

    return render(request, 'catalog/return.html', {'book': book})


def create_book(request):
    if request.method == 'POST':
        form = BookForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('book_list')
    else:
        form = BookForm()

    return render(request, 'catalog/create_book.html', {'form': form})


def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)  # Log in immediately
            return redirect('home')
    else:
        form = RegisterForm()

    return render(request, 'catalog/register.html', {'form': form})

@login_required
def home(request):
    context = {'user': request.user, 'title': 'Home Page'}
    return render(request, 'catalog/home.html', context)