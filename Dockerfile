# syntax=docker/dockerfile:1
FROM python:3.8-slim-buster
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
COPY templates/ /app/templates/
COPY static/ /app/static/
ENV FLASK_APP=main.py
ENV FLASK_ENV=mproduction
EXPOSE 3000
CMD ./main.py
