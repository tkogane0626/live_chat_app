# フロントエンドのベースイメージを設定
FROM node:21

# 環境変数を設定
ENV LANG C.UTF-8
ENV TZ="Asia/Tokyo"

# アプリケーションの依存関係をインストール
RUN apt-get update -qq && apt-get install -y

# ビルドの実行
WORKDIR /app/frontend
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build
