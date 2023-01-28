# build_files.sh
pip install --upgrade pip
python3.9 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
python3.9 manage.py collectstatic