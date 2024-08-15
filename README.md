# README

## 1. リポジトリの準備

### リポジトリの作成
- 以下のリポジトリを開き、`Use this template`で`Create a new repository`を選択し、自分のGitHubアカウント配下にリポジトリを作成します。
  - [rails7_docker_template](https://github.com/ihatov08/rails7_docker_template)

### リポジトリのクローン
- ローカルの任意のディレクトリにリポジトリをクローンします。
  - コマンド: `git clone <リポジトリURL>`

## 2. Dockerfileとdocker-composeの設定

### 必要なファイルの作成
- 以下のファイルをプロジェクトのルートディレクトリに作成します。
  - `Dockerfile`
  - `Dockerfile.lock`
  - `docker-compose.yml`

### Dockerfileの設定
- `Dockerfile`をエディタで開き、以下の内容を記載します。

```
FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs
WORKDIR /rails_docker
COPY Gemfile Gemfile.lock /rails_docker/
RUN bundle install
```
### Docker Composeの設定
- `docker-compose.yml`をエディタで開き、以下の内容を記載します。
```
version: '3'

volumes:
  db-data:

services:
  db:
    image: postgres:12
    platform: linux/amd64
    environment:
      POSTGRES_HOST_AUTH_METHOD: trust
    volumes:
      - db-data:/var/lib/postgres/data

  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    platform: linux/amd64
    environment:
      - DATABASE_PASSWORD=postgres
    volumes:
      - .:/rails_docker
    ports:
      - "3000:3000"
    depends_on:
      - db
    links:
      - db
    tty: true
    stdin_open: true
```
## 3. データベース設定の変更

### `database.yml` の修正
- クローンしたプロジェクトの `config/database.yml` を開き、PostgreSQLを使うように修正します。
- （同ファイル内のdefaultセクション部分を修正します）

```

default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  user: postgres
  port: 5432
  password: <%=ENV.fetch("DATABASE_PASSWORD") %>
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

```

## 4. コンテナの起動とデータベースの設定

### Docker Composeのインストール
- Docker Composeがインストールされていない場合は、インストールを行います。

### コンテナ内での作業
- `docker-compose exec web bash` でWebコンテナ内に入ります。
- データベースを作成するために `rails db:create` を実行します。
- Scaffoldを使用してテーブルを作成します。
  - コマンド: `rails g scaffold product name:string price:integer vendor:string`
- `rails db:migrate` を実行してデータベースをマイグレーションします。

## 5. アプリケーションの確認

### コンテナの起動
- `docker-compose up -d` コマンドを実行してコンテナをデタッチモードで起動します。

### アプリケーションの動作確認
- `http://localhost:3000` にブラウザでアクセスし、アプリケーションが正常に動作しているか確認します。
