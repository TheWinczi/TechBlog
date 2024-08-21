FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apt-get update && apt-get install -y gettext

WORKDIR /app/techblog

COPY ./techblog .

CMD /bin/sh -c "/app/techblog/initDB.sh && django-admin compilemessages -l pl_PL && python manage.py runserver 0.0.0.0:8000"
