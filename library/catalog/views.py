from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LoginView, LogoutView
from .forms import RegisterForm
from .models import Book


def book_list(request):
    books = Book.objects.all()  # Fetch all books from the database
    return render(request, 'catalog/book_list.html', {'books': books})

def book_detail(request, pk):
    book = get_object_or_404(Book, pk=pk)  # Fetch the book by its primary key (pk)
    return render(request, 'catalog/book_detail.html', {'book': book})



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