import sys

from django.conf import settings
from django.conf.urls import url
from django.core.management import execute_from_command_line
from django.http import HttpResponse, QueryDict
from django.views.decorators.csrf import csrf_exempt
from django.views.generic.base import View

settings.configure(
    DEBUG=True,
    SECRET_KEY='A-random-secret-key!',
    ROOT_URLCONF=sys.modules[__name__],
)

@csrf_exempt
def index(request):

    return HttpResponse('<h1>Hello World!</h1>')

urlpatterns = [
    url(r'^$', index),
]

if __name__ == '__main__':
    execute_from_command_line(sys.argv)
