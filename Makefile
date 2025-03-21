NAME = inception
all:
	@printf "Launching configuration ${NAME}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@sudo docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --force-recreate --renew-anon-volumes

build:
	@printf "Building configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@sudo docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build --force-recreate --renew-anon-volumes

up:
	@printf "Starting configuration ${NAME}...\n"
	@sudo docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --force-recreate --no-deps --renew-anon-volumes
down:
	@printf "Stopping configuration ${NAME}...\n"
	@sudo docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down --volumes --remove-orphans

re:	down
	@printf "Rebuild configuration ${NAME}...\n"
	@sudo docker-compose -f ./docker-compose.yml --env-file srcs/.env up -d --build --force-recreate --renew-anon-volumes

clean: down
	@printf "Cleaning configuration ${NAME}...\n"
	@sudo docker system prune -a -f
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@printf "Total cleanup of all configurations of docker\n"
	@sudo docker stop $$(sudo docker ps -qa) 2>/dev/null || true
	@sudo docker system prune --all --force --volumes
	@sudo docker network prune --force
	@sudo docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean
