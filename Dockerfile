#I specify the parent base image which is the python version 3.7
FROM python:3.7

MAINTAINER Nithin-T-S <nithints434@gmail.com>

# This prevents Python from writing out pyc files
ENV PYTHONDONTWRITEBYTECODE 1
# This keeps Python from buffering stdin/stdout
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN yum-get update \
    && yum-get -y install gcc make \
    && rm -rf /var/lib/apt/lists/*

# install dependencies
RUN pip install --no-cache-dir --upgrade pip

# set work directory
WORKDIR /src/main

# copy requirements.txt
COPY ./requirements.txt /src/app/requirements.txt

# install project requirements
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

# set work directory
WORKDIR /src/main.py

# set app port
EXPOSE 5000

ENTRYPOINT [ "python" ] 

# Run app.py when the container launches
CMD [ "main.py","run","--host","0.0.0.0"] 
