FROM buildpack-deps:xenial-curl
MAINTAINER https://github.com/muccg

ENV GITHUB_CHANGELOG_GENERATOR_VERSION 1.13.1

RUN apt-get update && apt-get install -qy --no-install-recommends \
   git \
   ruby \
   ruby-dev \
   rubygems \
   && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install github_changelog_generator -v ${GITHUB_CHANGELOG_GENERATOR_VERSION}

RUN mkdir -p /data
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/github_changelog_generator"]
