FROM ruby:2.6

RUN gem update --system
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        nodejs \
        npm \
    && rm -rf /var/lib/apt/lists/*
RUN npm install yarn -g
RUN gem install bundler:2.0.1

WORKDIR /usr/src/app
COPY . .
RUN bundle install
RUN rails assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
