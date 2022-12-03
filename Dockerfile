FROM ruby:2.5.1

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential inotify-tools less nodejs postgresql postgresql-contrib libpq-dev curl

WORKDIR /app

EXPOSE 3000