#!/bin/sh

if [ "$DATABASE" = "mysql" ]
then
    echo "Waiting for mysql..."
    echo $SQL_HOST
    while ! nc -z $SQL_HOST $SQL_PORT; do
     	   echo "inside loop waiting db ...."
	    sleep 60
    done

    echo "MySQL started sucessfully ...!!!" 
fi

python manage.py flush --no-input
python manage.py migrate --no-input
python manage.py collectstatic --no-input --clear
gunicorn djk8s_pipeline.wsgi:application --bind 0.0.0.0:8000
# python manage.py runserver 0.0.0.0:8000
exec "$@"
