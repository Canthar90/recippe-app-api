FROM python:3.11.0a7-alpine
MAINTAINER Dawid Cieslak

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt




RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app/
COPY ./app /app


RUN adduser -D user
USER user
