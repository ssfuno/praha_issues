SERVICE_NAME = db

# コンテナの起動
up:
	docker compose up -d --build

# Neo4jが起動するまで待機
wait-for-neo4j:
	@echo "Waiting for Neo4j to be ready..."
	@until docker compose exec $(SERVICE_NAME) bash -c "wget -q --spider http://localhost:7474"; do \
		echo "Neo4j is not ready yet. Retrying in 1 second..."; \
		sleep 1; \
	done
	@echo "Neo4j is ready!"

# Neo4jに接続して初期データを投入
# TODO: 本当は初期データを自動で実行されるようにした方が良い
insert-init-data:
	$(MAKE) wait-for-neo4j
	docker compose exec $(SERVICE_NAME) bash -c "cypher-shell --file /init_query.cypher"

# コンテナを起動してNeo4jに初期データを投入
start:
	$(MAKE) up
	$(MAKE) insert-init-data

# コンテナ、ネットワークの削除
stop:
	docker compose down

# コンテナ、ネットワーク、イメージ、ボリュームの削除
destroy:
	docker compose down --rmi all --volumes --remove-orphans