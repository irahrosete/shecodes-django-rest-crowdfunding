# build_files.sh
pip install --upgrade pip
python -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
python /crowdfunding/manage.py collectstatic --noinput