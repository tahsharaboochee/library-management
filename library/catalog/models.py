from django.db import models
from django.contrib.auth.models import User

class Circulation(models.Model):
    book_id = models.CharField(max_length=100)  # To store Google Books ID
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    checkout_date = models.DateField(null=True)
    return_date = models.DateField(null=True)
    reserved = models.BooleanField(default=False)
