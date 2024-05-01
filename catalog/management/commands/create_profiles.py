from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from catalog.models import Profile

class Command(BaseCommand):
    help = 'Create profiles for all existing users without one'

    def handle(self, *args, **kwargs):
        for user in User.objects.all():
            if not hasattr(user, 'profile'):
                Profile.objects.create(user=user)
                print(f"Created profile for {user.username}")
