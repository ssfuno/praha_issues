# 環境構築方法

## 前提条件
- Dockerがインストールされていること

## 手順

1. MySQLコンテナの起動
    ```sh
    docker compose -f mysql_docker_setup/compose.yaml up -d
    ```

2. データベースへの接続
    ```sh
    docker exec -it <コンテナ名> mysql -u root -p
    ```

    - パスワード： `root`
    - データベース名： `sushidb`

    ローカル環境のDBクライアントから接続する場合
    - ポート: `3307`
    - ユーザー名: `root`
    - パスワード: `root`
    - データベース名: `sushidb`