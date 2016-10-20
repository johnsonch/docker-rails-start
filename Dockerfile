FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y autoconf automake bison build-essential curl git-core libapr1 libaprutil1 libc6-dev libltdl-dev libreadline6 libreadline6-dev libsqlite3-0 libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libxslt1-dev libyaml-dev ncurses-dev nodejs openssl sqlite3 zlib1g zlib1g-dev
RUN mkdir /myapp
WORKDIR /myapp
RUN gem install bundler rails
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
