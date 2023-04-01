# syntax=docker/dockerfile:1
FROM ubuntu
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
COPY templates/ /app/templates/
COPY static/ /app/static/
ENV FLASK_APP=main.py
ENV FLASK_ENV=production
EXPOSE 3000
CMD ./main.py
