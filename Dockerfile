FROM python:3.8-alpine
MAINTAINER Fawzi Almasri
# Avoids some complications when building the image
ENV PYTHONUNBUFFERED 1

# Pulls the packages needed and updates them concurrently
RUN echo "http://dl-8.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk update \
  && apk add py3-numpy py3-pandas py3-scikit-learn

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
