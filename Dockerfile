
FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV ms_notifications /app

RUN mkdir /ms_notifications
WORKDIR /ms_notifications
COPY . /ms_notifications
ADD Gemfile /ms_notifications/Gemfile
ADD Gemfile.lock /ms_notifications/Gemfile.lock

RUN bundle install

EXPOSE  4003 27017
ADD . /ms_notifications
