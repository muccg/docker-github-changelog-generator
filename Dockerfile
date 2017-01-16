FROM ruby:2.3-alpine
MAINTAINER https://github.com/muccg/

ARG ARG_GITHUB_CHANGELOG_GENERATOR_VERSION

ENV GITHUB_CHANGELOG_GENERATOR_VERSION $ARG_GITHUB_CHANGELOG_GENERATOR_VERSION

RUN gem install github_changelog_generator -v ${GITHUB_CHANGELOG_GENERATOR_VERSION}
RUN mkdir -p /data
WORKDIR /data

ENTRYPOINT ["/usr/local/bundle/bin/github_changelog_generator"]
