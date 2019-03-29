FROM ruby:2.6

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt update \
    && apt install -y --no-install-recommends \
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
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
