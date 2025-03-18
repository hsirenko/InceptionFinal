NAME = simple_nginx
all:
	@printf "Launching configuration ${NAME}...\n"
	@docker-compose -f ./docker-compose.yml up -d

build:
	@printf "Building configuration ${NAME}...\n"
	@docker-compose -f ./docker-compose.yml up -d --build

down:
	@printf "Stopping configuration ${NAME}...\n"
	@docker-compose -f ./docker-compose.yml down

re:	down
	@printf "Rebuild configuration ${NAME}...\n"
	@docker-compose -f ./docker-compose.yml up -d --build

clean: down
	@printf "Cleaning configuration ${NAME}...\n"
	@docker system prune -a

fclean:
	@printf "Total cleanup of all configurations of docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all build down re clean fclean
