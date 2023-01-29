#!/bin/bash

# build_files.sh
# pip install --upgrade pip
# python -m venv .venv
# . .venv/bin/activate
# pip install -r requirements.txt
# python /crowdfunding/manage.py collectstatic --noinput


echo "Building the project..."
python3.9 -m pip install -r requirements.txt

# echo "Make Migration..."
# python3.9 /crowdfunding/manage.py makemigrations --noinput
python3.9 /crowdfunding/manage.py migrate --noinput
python3.9 /crowdfunding/manage.py createsuperuser --noinput


gunicorn --bind :8000 --workers 1 crowdfunding.wsgi

echo "Collect Static..."
python3.9 /crowdfunding/manage.py collectstatic --noinput --clear