FROM python:3.11.0a7-alpine
MAINTAINER Dawid Cieslak

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps




RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app/
COPY ./app /app


RUN adduser -D user
USER user
