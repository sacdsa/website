FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt update \
    && apt install -y --no-install-recommends \
        postgresql-client \
        nodejs \
        yarn \
    && rm -rf /var/lib/apt/lists/*
RUN gem install bundler:2.0.2

WORKDIR /usr/src/app
COPY . .
RUN bundle install
RUN rails assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
