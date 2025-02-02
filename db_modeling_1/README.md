# 環境構築方法

## 前提条件
- Dockerおよびmakeがインストールされていること

## 手順

1. MySQLコンテナの起動および接続
    ```sh
    make setup
    ```

2. MySQLコンテナの削除
    ```sh
    make stop
    ```
    イメージやボリュームも削除したい場合
    ```sh
    make destroy
    ```