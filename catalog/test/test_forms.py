from django.test import TestCase
from catalog.forms import BookForm


class FormTestCase(TestCase):
    def test_book_form_valid(self):
        form = BookForm(data={'title': "New Book", 'author': "Author", 'isbn': "1234567890123"})
        self.assertTrue(form.is_valid())

    def test_book_form_invalid(self):
        form = BookForm(data={})
        self.assertFalse(form.is_valid())
