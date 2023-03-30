# syntax=docker/dockerfile:1
FROM python:3.8-slim-buster
WORKDIR ~/flask_dictionary
COPY requirements.txt
requirement.txt
RUN pip3 install -r
requirements.txt
COPY ..
CMD [ "python3","-m","--host"="0.0.0.0"] 
