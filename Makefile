UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	ENV_FILE = ./srcs/.env.macos
else
	ENV_FILE = ./srcs/.env
endif

VOLUMES_PATH = ${HOME}/data
VOLUMES_DIR = database web

VOLUMES = $(addprefix $(VOLUMES_PATH)/, $(VOLUMES_DIR))


all: down up

up:
	mkdir -p $(VOLUMES)
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f srcs/docker-compose.yml down

clean: down
	docker volume rm $(addprefix srcs_, $(VOLUMES_DIR)) -f
	docker volume prune -f
	rm -rf $(VOLUMES)

prune: clean
	docker system prune -af

re: prune up

.PHONY: all up down clean prune re
