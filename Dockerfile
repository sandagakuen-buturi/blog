FROM ruby:3.3

WORKDIR /rails

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  nodejs \
  sqlite3 \
  libsqlite3-dev \
  curl

# bunのインストール
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

COPY Gemfile ./
RUN bundle install

COPY . .
RUN bundle install --gemfile /rails/Gemfile

# JSビルド
RUN bun install && bun run build

EXPOSE 3000

CMD ["bash"]