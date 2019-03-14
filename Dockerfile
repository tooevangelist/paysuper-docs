FROM ruby:2.4-slim-stretch
EXPOSE 4567
EXPOSE 4568

LABEL maintainer="nikolay.bondarenko@protocol.one"

ADD deploy.sh /app/deploy.sh
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN chmod 755 /app/deploy.sh \
    && apt-get -qq update \
    && apt-get -qq -y install make gcc g++ git nodejs wget \
    && cd /app; bundle install

WORKDIR /app
