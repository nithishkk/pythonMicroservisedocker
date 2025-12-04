#!/bin/sh

host="$1"
shift

echo "Waiting for MySQL at $host..."

while ! nc -z $host 3306; do
  sleep 1
done

echo "MySQL is up - starting Django"
exec "$@"
