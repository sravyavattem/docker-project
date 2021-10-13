FROM python:3.8-slim-buster

WORKDIR /app
EXPOSE 80

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install -r requirements.txt


COPY . /app

CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]
