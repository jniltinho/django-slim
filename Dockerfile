FROM django:python2

RUN apt-get update && apt-get install -y \
	libsasl2-dev python-dev libldap2-dev libssl-dev \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install mysqlclient psycopg2 gunicorn pbr docutils==0.15.2

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
#COPY . .

#EXPOSE 8000
#CMD ["python", "manage.py", "runserver", "--insecure", "0.0.0.0:8000"]
