FROM ruby:2.6

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        nodejs
    && rm -rf /var/lib/apt/lists/*
RUN gem install bundler:2.0.1

WORKDIR /usr/src/app
COPY . .
RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
