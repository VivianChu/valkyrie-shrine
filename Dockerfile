ARG ALPINE_VERSION=3.19
ARG RUBY_VERSION=3.2.3

FROM ruby:$RUBY_VERSION-alpine$ALPINE_VERSION 

RUN apk --no-cache upgrade && \
  apk --no-cache add acl \
  build-base \
  git \
  bash

RUN mkdir -p /app
WORKDIR /app
COPY . ./
RUN bin/setup
# RUN bundle exec rake spec