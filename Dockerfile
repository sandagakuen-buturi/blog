FROM ruby:3.3

WORKDIR /rails

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  nodejs \
  sqlite3 \
  libsqlite3-dev \
  curl

COPY Gemfile ./

RUN bundle install

COPY . .

RUN bundle install --gemfile /rails/Gemfile

EXPOSE 3000

CMD ["bash"]