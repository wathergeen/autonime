FROM python:3.10.5-slim-buster

ENV \
    DEV_ENV=${DEV_ENV} \
    TZ="America/Araguaina" \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    DJANGO_ENV=develop

RUN apt update && \
    apt install libpq-dev libcurl4-openssl-dev libssl-dev default-libmysqlclient-dev gcc make libjpeg-dev curl git pkg-config -y \
    && apt install python3-pip python3-cffi python3-brotli libpango-1.0-0 libharfbuzz0b libpangoft2-1.0-0 -y \
    && apt-get install libpangocairo-1.0-0 -y \
    && apt install libcairo2-dev -y \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U pip && pip install poetry

WORKDIR /app

EXPOSE 8080

COPY pyproject.toml poetry.lock /app/

RUN poetry config virtualenvs.create false \
    && poetry install

COPY . .

