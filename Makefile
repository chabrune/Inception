up:
	@sudo mkdir -p ~/data/wordpress
	@sudo mkdir -p ~/data/mariadb
	@sudo docker-compose -f srcs/docker-compose.yml up
	@echo "Up"

upbuild:
	@sudo mkdir -p ~/data/wordpress
	@sudo mkdir -p ~/data/mariadb
	@sudo docker-compose -f srcs/docker-compose.yml up --build
	@echo "Upbuild"

nginx:
	@sudo docker exec -it nginx bash 2>/dev/null

wordpress:
	@sudo docker exec -it wordpress bash 2>/dev/null

mariadb:
	@sudo docker exec -it mariadb bash 2>/dev/null

down:
	@sudo docker-compose -f srcs/docker-compose.yml down
	@echo "Down"

rmvolume: down
	@sudo docker system prune -f
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo docker volume rm srcs_wordpress
	@sudo docker volume rm srcs_mariadb
	@echo "Removed volumes"

clean: down
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo docker system prune -f
	@echo "Cleaned"

re: clean up

.PHONY: up upbuild nginx wordpress mariadb down rmvolume clean re
