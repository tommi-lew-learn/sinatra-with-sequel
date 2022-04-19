FROM ruby:3-alpine

# Resolve CVE-2021-43618 for alpine 3.15.0
RUN apk update --no-cache libgmpxx gmp-dev gmp

ADD . /app
WORKDIR /app

RUN apk add --no-cache build-base

## PostgreSQL client library. Dependency for pg gem.
RUN apk add --no-cache libpq-dev

RUN gem install bundler:2.3.3

RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0"]
