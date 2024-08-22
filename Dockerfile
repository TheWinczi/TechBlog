FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app/techblog

COPY ./techblog .

RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y gettext

CMD /bin/sh -c "/app/techblog/initDB.sh && django-admin compilemessages -l pl_PL && python manage.py runserver 0.0.0.0:8000"
