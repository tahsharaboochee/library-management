from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView, LogoutView
from .forms import RegisterForm
from .models import Book
from .forms import BookForm
import requests
from .models import Circulation
from datetime import date

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

def checkout_book(request, id):
    if request.method == 'POST':
        Circulation.objects.create(book_id=id, user=request.user, checkout_date=date.today())
        return redirect('book_detail', id=id)

    return render(request, 'catalog/checkout.html', {'id': id})

def return_book(request, id):
    circulation = Circulation.objects.filter(book_id=id, user=request.user).order_by('-checkout_date').first()
    if circulation:
        circulation.return_date = date.today()
        circulation.save()

    return redirect('book_detail', id=id)


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