#!/bin/sh

echo "Waiting for MySQL..."

while ! nc -z mysql 3306; do
  sleep 1
done

echo "MySQL is up!"

# Run migrations
python manage.py migrate

# Start Django server
python manage.py runserver 0.0.0.0:8001
