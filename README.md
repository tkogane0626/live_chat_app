# Live Chat App

このリポジトリは、Vue.jsとRuby on Railsを使用したライブチャットアプリのサンプルです。

## フロントエンド
| ツール/ライブラリ      | バージョン    | 備考                |
|--------------------- |----------------|---------------------|
| Vue.js                 | 3.3.8          | -                   |

## バックエンド
| ツール/ライブラリ      | バージョン    | 備考                |
|------------------------|----------------|---------------------|
| Ruby                 | 3.1.4          | -                   |
| Rails                 | 7.0.8          | -                   |

## その他
| ツール/ライブラリ      | バージョン    | 備考                |
|------------------------|----------------|---------------------|
| Node.js                 | 21.7.3          | -                   |
| npm                 | 10.5.0          | -                   |
| postgres                 | 14.12          | -                   |
| puma                 | 6.4.2          | -                   |

## プロジェクトセットアップ
### リポジトリのクローン

以下のコマンドを実行して、プロジェクトをローカル環境にクローンします。

```bash
$ git clone https://github.com/tkogane0626/live_chat_app.git
```

### Dockerイメージのビルド

以下のコマンドを実行して、Dockerイメージをビルドします。

```bash
$ docker compose build
```

### Dockerコンテナの起動

以下のコマンドを実行して、Dockerコンテナを起動します。

```bash
$ docker compose up -d
```

### DBのセットアップ

以下のコマンドを実行して、データベースをセットアップします。
```bash
$ docker exec backend bundle exec rails db:setup
```
