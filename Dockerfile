
FROM python:3.6.1-alpine
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip &&\
    pip install markupsafe &&\
    pip install --upgrade setuptools &&\
    pip install ez_setup &&\
    pip install -r requirements.txt
CMD ["python3","main.py"]