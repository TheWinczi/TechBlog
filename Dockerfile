FROM python:3.10

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install python-gettext

RUN apt-get update && apt-get install -y gettext

COPY . .

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

CMD /bin/sh -c "/app/initDB.sh && django-admin compilemessages -l pl_PL && python manage.py runserver 0.0.0.0:8000"
