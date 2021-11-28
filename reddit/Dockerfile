FROM ruby:2.4.2-alpine

WORKDIR /app
COPY . ./

RUN apk --no-cache --update add build-base=0.4-r1 && \
    bundle install && \
    apk del build-base

ENV DATABASE_URL mongo:27017

CMD ["puma"]
