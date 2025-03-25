NAME = inception
all:
	@printf "Launching configuration ${NAME}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@bash srcs/requirements/tools/check_and_free_port.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@printf "Building configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@bash srcs/requirements/tools/check_and_free_port.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build 

up:
	@printf "Starting configuration ${NAME}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --force-recreate --no-deps --renew-anon-volumes 2>/dev/null
down:
	@printf "Stopping configuration ${NAME}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down --volumes --remove-orphans 2>/dev/null || true

re:	down
	@printf "Rebuild configuration ${NAME}...\n"
	@docker-compose -f ./docker-compose.yml --env-file srcs/.env up -d --build --force-recreate --renew-anon-volumes 2>/dev/null

clean: down
	@printf "Cleaning configuration ${NAME}...\n"
	@docker system prune -a -f 2>/dev/null
	@rm -rf ~/data/wordpress/*
	@rm -rf ~/data/mariadb/*

fclean: down
	@printf "Ensuring correct permissions before cleanup...\n"
	@sudo chown -R $(USER):$(USER) ~/data
	@sudo chmod -R 755 ~/data
	@printf "Total cleanup of all configurations of docker\n"
	@docker stop $$(sudo docker ps -qa) 2>/dev/null || true
	@docker system prune --all --force --volumes 2>/dev/null
	@docker network prune --force 2>/dev/null
	@docker volume prune --force 2>/dev/null
	@rm -rf ~/data/wordpress/*
	@rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean
