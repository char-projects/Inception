all:
	docker compose -f ./srcs/docker-compose.yml up --build

vol:
	docker compose -f ./srcs/docker-compose.yml down --volumes

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	make down
	make vol
	make all

.PHONY: all down vol re