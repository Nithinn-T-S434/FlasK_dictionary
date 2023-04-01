# syntax=docker/dockerfile:1
FROM python:3.9-alpine
WORKDIR /app
COPY . /app
RUN apk add --no-cache gcc musl-dev linux-headers && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del gcc musl-dev linux-headers
EXPOSE 3000
ENV FLASK_APP=main.py
ENTRYPOINT [ "python" ]
CMD ["flask","run","--host=0.0.0.0","--port=3000"]