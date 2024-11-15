.PHONY: build init

CMD_ARGS?=$(filter-out $@, $(MAKECMDGOALS)) $(MAKEFLAGS)
%:
	@true

up:
	docker compose up -d

down:
	docker compose down --remove-orphans

restart: down up

init: env-create build up

build:
	docker compose build

rebuild:
	docker compose up -d --no-deps --build $(CMD_ARGS)

tool-docker-logs:
	docker compose logs -f $(CMD_ARGS)

tool-docker-prune:
	docker image prune -f
	docker volume prune -f
	docker network prune -f

env-create:
	[ -f ./.env ] || cp ./.env.example ./.env
