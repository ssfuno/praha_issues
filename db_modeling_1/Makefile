.PHONY: setup
setup:
	docker compose -f mysql_docker_setup/compose.yaml up -d --build

.PHONY: teardown
teardown:
	docker compose -f mysql_docker_setup/compose.yaml down --rmi all --volumes --remove-orphans