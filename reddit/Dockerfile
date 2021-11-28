FROM ruby:2.4.2-alpine

WORKDIR /app
COPY . ./

RUN apk --no-cache --update add build-base && \
    gem install bundler && \
    install libgmp-dev && \
    apk del build-base

ENV DATABASE_URL mongo:27017

CMD ["puma"]
