# catalog/tests/test_views.py

from django.test import TestCase
from django.urls import reverse
from catalog.models import Book

class BookListViewTest(TestCase):
    @classmethod
    def setUpTestData(cls):
        number_of_books = 13
        for book_id in range(number_of_books):
            Book.objects.create(title=f'Sample Book {book_id}', author=f'Author {book_id}', isbn=f'{book_id}'*13)

    def test_view_url_exists_at_desired_location(self):
        response = self.client.get('/catalog/books/')
        self.assertEqual(response.status_code, 200)

    def test_view_url_accessible_by_name(self):
        response = self.client.get(reverse('book_list'))
        self.assertEqual(response.status_code, 200)

    def test_pagination_is_ten(self):
        response = self.client.get(reverse('book_list'))
        self.assertTrue('is_paginated' in response.context)
        self.assertTrue(response.context['is_paginated'] == True)
        self.assertEqual(len(response.context['book_list']), 10)

    def test_lists_all_books(self):
        response = self.client.get(reverse('book_list')+'?page=2')
        self.assertEqual(response.status_code, 200)
        self.assertTrue('is_paginated' in response.context)
        self.assertTrue(response.context['is_paginated'] == True)
        self.assertEqual(len(response.context['book_list']), 3)
