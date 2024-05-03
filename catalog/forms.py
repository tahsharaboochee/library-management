from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Book, Circulation, Profile


class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['address', 'phone_number']


class CirculationForm(forms.ModelForm):
    class Meta:
        model = Circulation
        fields = ['book_id', 'checkout_date', 'return_date', 'reserved']
        

class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = ['title', 'author', 'isbn', 'publication_year']


class RegisterForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ("username", "email", "password1", "password2")

    def save(self, commit=True):
        user = super().save(commit=False)
        user.email = self.cleaned_data["email"]
        if commit:
            user.save()
        return user
class BookFetchForm(forms.Form):
    identifier = forms.CharField(label='Book Identifier', max_length=100)
