# バックエンドのベースイメージを設定
FROM ruby:3.1.4

# 環境変数を設定
ENV LANG C.UTF-8
ENV TZ="Asia/Tokyo"

# アプリケーションの依存関係をインストール
RUN apt-get update -qq && apt-get install -y

# ビルドの実行
WORKDIR /app/backend
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle config set force_ruby_platform true && bundle install
COPY . .
