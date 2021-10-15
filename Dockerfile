FROM scratch
ADD alpine-minirootfs-3.11.12-x86_64.tar.gz /
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
#FROM python:3.8-slim-buster

WORKDIR /app
EXPOSE 80

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt


COPY . /app

CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]
