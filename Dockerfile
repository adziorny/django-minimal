# Set the base package - these can be grabbed from docker hub
FROM python:3.4.3-wheezy

# Set the maintainer for good code practice
MAINTAINER Adam Dziorny "dziornya@email.chop.edu"

# Place the items that will take a while to run up front
# This is so when you add files down below, Docker build can
# use cached images from lines above and you won't have to 
# re-build the time-intensive installs
RUN apt-get -qq --fix-missing update
RUN apt-get install -y\
    software-properties-common\
    build-essential\
    git-core\
    libldap2-dev\
    libpq-dev\
    libsasl2-dev\
    libssl-dev\
    libxml2-dev\
    libxslt1-dev\
    libffi-dev\
    openssl\
    wget\
    netcat\
    zlib1g-dev\
    vim
    
# Python dependencies
RUN pip install --upgrade "pip"
RUN pip install "Django==1.10"
RUN pip install "uWSGI"
RUN pip install "requests"
RUN pip install "djangorestframework>=3.0"
RUN pip install "pycrypto==2.6.1"
RUN pip install "python-dateutil==2.2"
RUN pip install "rsa"
RUN pip install "markdown==2.6.1"
RUN pip install "elasticsearch"
RUN pip install "pytz"
RUN pip install "django-cors-headers"
RUN pip install "zeep"
RUN pip install "psycopg2"

# Set the Working Directory
WORKDIR /usr/src/app

# Copy the minimal django file into the working directory
COPY minimal-django.py /usr/src/app

# Expose port 8000
EXPOSE 8000

# Run the server
CMD python minimal-django.py runserver 0.0.0.0:8000

