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

# Composer Commands
composer-install:
	$(PHP_CONTAINER) composer install
composer-update:
	$(PHP_CONTAINER) composer update
composer-dump-autoload:
	$(PHP_CONTAINER) composer dump-autoload
composer-require:		
	$(PHP_CONTAINER) composer require $(filter-out $@,$(MAKECMDGOALS))
composer-remove:
	$(PHP_CONTAINER) composer remove $(filter-out $@,$(MAKECMDGOALS))
composer-update-require:
	$(PHP_CONTAINER) composer update $(filter-out $@,$(MAKECMDGOALS))
composer-update-require-dev:
	$(PHP_CONTAINER) composer update $(filter-out $@,$(MAKECMDGOALS)) --dev
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
	@echo "  make composer-install - Install Composer dependencies"
	@echo "  make composer-update  - Update Composer dependencies"
	@echo "  make composer-dump-autoload - Dump autoload files"
	@echo "  make composer-require - Require a new Composer package"
	@echo "  make composer-remove - Remove a Composer package"
	@echo "  make composer-update-require - Update a specific Composer package"
	@echo "  make composer-update-require-dev - Update a specific Composer package in dev mode"
	@echo "  make help       	- Show this help message"
