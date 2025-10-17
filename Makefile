all:
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down --volumes

fclean: clean
	docker system prune -af
	docker volume prune -f
	sudo rm -rf srcs/web srcs/db

re:
	make down
	make fclean
	make all

.PHONY: all down clean fclean re