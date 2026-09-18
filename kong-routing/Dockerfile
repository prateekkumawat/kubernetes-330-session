# syntax=docker/dockerfile:1.4
FROM python:3.10-alpine

WORKDIR /app

RUN pip3 install flask

COPY app/app.py /app/

CMD ["python3", "app.py"]

EXPOSE 8000