# syntax=docker/dockerfile:1
FROM python:3.6.1-alpine
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip
RUN pip install markupsafe
RUN pip install --upgrade setuptools
RUN pip install ez_setup
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["python","main.py"]