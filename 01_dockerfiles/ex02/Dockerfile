FROM ruby:2.3.0

RUN apt-get update && apt-get install -y mysql-client sqlite3 --no-install-recommends
RUN apt-get install -y rails

ENV RAILS_ENV production 
ENV RACK_ENV production

RUN mkdir -p /opt/app
WORKDIR /opt/app
ONBUILD COPY Gemfile /opt/app/
ONBUILD COPY Gemfile.lock /opt/app/

ONBUILD RUN bundle install
ONBUILD RUN rake db:setup
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed

ONBUILD COPY . /opt/app/
