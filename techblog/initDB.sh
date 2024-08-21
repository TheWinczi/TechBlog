#!/bin/bash

python manage.py makemigrations

if [ "${DEVELOPMENT}" = "true" ]; then
  python manage.py migrate &&
  python manage.py loaddata groups.json &&
  python manage.py loaddata accounts.json &&
  python manage.py loaddata posts.json &&
  python manage.py loaddata comments.json
else
    echo "Variable DEVELOPMENT (= ${DEVELOPMENT}) is not set to true. No data have been initialized."
fi

