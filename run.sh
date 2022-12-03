#!/bin/sh
set -e

gem update --system
gem update bundler
# gem install rails
# rails new octo --api --database=postgresql
# cd octo

bundle install --without=production

bundle exec rails db:create
bundle exec rails db:migrate


rm -f tmp/pids/server.pid
bin/rails s -p 3000 -b '0.0.0.0'