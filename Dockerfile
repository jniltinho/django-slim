FROM django:python2

## https://hub.docker.com/_/django
## docker build -t my-app .
## docker run -v "$PWD":/usr/src/app -w /usr/src/app -p 8000:8000 --rm -it my-app bash
## python manage.py collectstatic --no-input
## gunicorn --bind 0.0.0.0:8000 my-app.wsgi
## python manage.py runserver --insecure 0.0.0.0:8000


RUN apt-get update && apt-get install -y \
	libsasl2-dev python-dev libldap2-dev libssl-dev \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install cpython gunicorn pbr docutils==0.15.2

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
#COPY . .

#EXPOSE 8000
#CMD ["python", "manage.py", "runserver", "--insecure", "0.0.0.0:8000"]
