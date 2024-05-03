from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient

class APITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()

    def test_get_books_api(self):
        response = self.client.get(reverse('catalog:api_books'))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
