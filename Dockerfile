FROM ruby:3.1.2-alpine3.15 as builder

RUN apk update && \
    apk add --no-cache \
    gcc \
    g++ \
    gcompat \
    libc-dev \
    libxml2-dev \
    linux-headers \
    make \
    mysql-client \
    mysql-dev \
    bash \
    tzdata && \
    apk add --virtual build-packs --no-cache \
    build-base \
    curl-dev \
    bash

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

#RUN gem install bundler
RUN bundle update --bundler
RUN bundle install

COPY . .
