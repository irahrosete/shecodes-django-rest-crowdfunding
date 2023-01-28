ARG PYTHON_VERSION=3.10-slim-buster

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# RUN mkdir -p /code

WORKDIR /code

# COPY requirements.txt /tmp/requirements.txt
COPY requirements.txt /code/

RUN set -ex && \
    pip install --upgrade pip && \
    python -m venv .venv  && \
    pip install -r /code/requirements.txt && \
    rm -rf /root/.cache/

COPY . /code/