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

### 5. データベースの作成
次に、コンテナを起動し、データベースを作成します。
```bash
docker-compose up -d
docker-compose exec web rails db:create
```

### 6. マイグレーションの実行
データベースのマイグレーションを実行して、必要なテーブルを作成します。
```bash
docker-compose exec web rails db:migrate
```

### 7. アプリケーションの起動
すべてのセットアップが完了したら、以下のコマンドでアプリケーションを起動します。

```bash
docker-compose up
```

### 8. ブラウザで確認
ブラウザで http://localhost:3000 にアクセスして、アプリケーションが正常に起動していることを確認します。


