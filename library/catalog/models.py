from django.db import models
from django.contrib.auth.models import User


class Book(models.Model):
    title = models.CharField(max_length=200)
    author = models.CharField(max_length=200)
    isbn = models.CharField(max_length=13, unique=True)
    publication_year = models.IntegerField()

    def __str__(self):
        return f"{self.title} by {self.author}"
    
    def availability_status(self):
        last_transaction = Transaction.objects.filter(book=self).order_by('-date').first()

        if last_transaction:
            if last_transaction.transaction_type == "checkout":
                return "Checked Out"
            elif last_transaction.transaction_type == "reserve":
                return "Reserved"
        
        return "Available"

    

class Transaction(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE)  # Link to the Book model
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Link to the User model
    transaction_type = models.CharField(max_length=20, choices=[("checkout", "Checkout"), ("return", "Return"), ("reserve", "Reserve")])
    date = models.DateField(auto_now=True)  # Automatically set to today's date

    def __str__(self):
        return f"{self.transaction_type} for {self.book.title} by {self.user.username} on {self.date}"

class Circulation(models.Model):
    book_id = models.CharField(max_length=100)  # To store Google Books ID
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    checkout_date = models.DateField(null=True)
    return_date = models.DateField(null=True)
    reserved = models.BooleanField(default=False)
