FROM muhlibsc/docker-ruby-mongodb
ENV RAILD_LOG_TO_STDOUT=1 \ RAILS_ENV = production

RUN mkdir /ms_notifications
WORKDIR /ms_notifications
COPY . /ms_notifications
ADD Gemfile /ms_notifications/Gemfile
ADD Gemfile.lock /ms_notifications/Gemfile.lock

RUN --name ms_notifications_db -d mongo
RUN --name ms_notifications --link ms_notifications_db:mongo -d ms_notifications
RUN --name ms_notifications_db -d mongo --auth

RUN bundle install

EXPOSE 80 4007
ADD . /ms_notifications





