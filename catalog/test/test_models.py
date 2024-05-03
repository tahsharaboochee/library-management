from django.test import TestCase
from catalog.models import Book


class BookModelTest(TestCase):
    def test_string_representation(self):
        book = Book(title="1984", author="George Orwell")
        self.assertEqual(str(book), "1984 by George Orwell")

    def test_availability_status(self):
        book = Book.objects.create(title="Sample Book", author="Author", isbn="1234567890123")
        self.assertEqual(book.availability_status(), "Available")
