SERVICE_NAME = db
MYSQL_USER = root
MYSQL_PASSWORD = root

# コンテナの起動
up:
	docker compose up -d --build

# MySQLが起動するまで待機
wait-for-mysql:
	@echo "Waiting for MySQL to be ready..."
	@until docker compose exec $(SERVICE_NAME) mysqladmin ping -h 127.0.0.1 --silent; do \
		echo "MySQL is not ready yet. Retrying in 1 second..."; \
		sleep 1; \
	done
	@echo "MySQL is ready!"

# MySQLに接続
mysql-connect:
	$(MAKE) wait-for-mysql
	docker compose exec $(SERVICE_NAME) bash -c "mysql -u $(MYSQL_USER) -p$(MYSQL_PASSWORD)"

# コンテナを起動してMySQLに接続
start:
	$(MAKE) up
	$(MAKE) mysql-connect

# コンテナ、ネットワークの削除
stop:
	docker compose down

# コンテナ、ネットワーク、イメージ、ボリュームの削除
destroy:
	docker compose down --rmi all --volumes --remove-orphans