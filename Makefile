# Variables
DOCKER_COMPOSE = docker compose
PHP_CONTAINER = $(DOCKER_COMPOSE) exec php

default: help
# Docker Commands
up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) restart

# Symfony Commands
cache-clear:
	$(PHP_CONTAINER) php bin/console cache:clear

migrate:
	$(PHP_CONTAINER) php bin/console doctrine:migrations:migrate --no-interaction

# Git Commands
push:
	git commit -a -m "Update" && git push

pull:
	git pull

status:
	git status

# Aide
help:
	@echo "Available commands:"
	@echo "  make up         	- Start Docker containers"
	@echo "  make down       	- Stop Docker containers"
	@echo "  make restart    	- Reboot Docker containers"
	@echo "  make cache-clear 	- Clean the Symfony cache"
	@echo "  make migrate    	- Run symfony migrations"
	@echo "  make push       	- Commit and push Git changes"
	@echo "  make pull       	- Get the latest changes Git"
	@echo "  make status     	- See the status of the Git repository"
