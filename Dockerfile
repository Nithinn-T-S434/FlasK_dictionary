# syntax=docker/dockerfile:1
FROM python:3.6.1-alpine
WORKDIR /app
COPY . /app
RUN apt install -y python3-markupsafe
RUN pip install -r requirements.txt
EXPOSE 3000
CMD ["python","main.py"]