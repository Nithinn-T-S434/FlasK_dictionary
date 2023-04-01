# syntax=docker/dockerfile:1
FROM python:3-alpine
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 3000
ENTRYPOINT [ "python" ]
#COPY templates/ /app/templates/
#COPY static/ /app/static/
#ENV FLASK_APP=main.py
#ENV FLASK_ENV=production
CMD ["main.py"]