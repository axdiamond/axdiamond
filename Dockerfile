FROM ruby:alpine

ENV GITHUB_GEM_VERSION 202
ENV JSON_GEM_VERSION 1.8.6

RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
  && gem install --verbose --no-document \
    github-pages:${GITHUB_GEM_VERSION} \
  && apk del build_deps \
  && apk add git \
  && mkdir -p /usr/src/app \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem


WORKDIR /usr/src/app
COPY . .

EXPOSE 4000 80
CMD jekyll serve -H 0.0.0.0 -P 4000

