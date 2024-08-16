# Rails Docker Template

## 概要
このリポジトリは、Docker を使用して Rails 開発環境を簡単に構築するためのテンプレートです。PostgreSQL データベースを使用し、コンテナ化された開発環境を構築します。

## 環境構築手順

### 1. リポジトリをクローンする
まず、以下のコマンドを使用して、このリポジトリをローカル環境にクローンします。

```bash
git clone https://github.com/<あなたのユーザー名>/rails-docker.git
cd rails-docker
```

### 2. クローンしたプロジェクトのルートディレクトリへ移動する
```bash
cd rails_docker
```

### 3. Docker と Docker Compose のインストール
Docker と Docker Compose がインストールされていることを確認してください。以下のコマンドでインストールを確認できます。
```bash
docker --version
docker-compose --version
```

### 4. Docker イメージのビルド
Docker イメージをビルドします。
```bash
docker-compose build
```

### 5. コンテナの起動
コンテナを起動します。
```bash
docker-compose up -d
```

### 6. コンテナ内に入り、データベースの作成とマイグレーションを実行
初回起動時は、コンテナ内に入り、データベースの作成とマイグレーションを行います。
```bash
docker-compose exec web bash
rails db:create
rails db:migrate
```
### 7. ブラウザで確認
ブラウザで http://localhost:3000 にアクセスして、アプリケーションが正常に起動していることを確認します。


