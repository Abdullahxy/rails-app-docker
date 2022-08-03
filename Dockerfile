FROM ruby:2.7.2-alpine

RUN apk add --update \
    nodejs \
    tzdata \
    --update build-base \
    musl \
    sqlite \
    sqlite-dev

# RUN apk add --update build-base

# RUN apk add musl \
#     sqlite \
#     sqlite-dev

RUN mkdir -p /web

WORKDIR /web
ADD Gemfile /web/Gemfile
ADD Gemfile.lock /web/Gemfile.lock
COPY . /web/

RUN bundle install

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
CMD ["sh", "docker-entrypoint.sh"]

EXPOSE 3000
