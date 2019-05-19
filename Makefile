include .env
export

.PHONY: help

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## builds containers
	docker-compose${DOCKEREXE} build

up: ## ups the composition
	docker-compose${DOCKEREXE} up --force-recreate --build

bash: ## bash script to various services
	docker-compose${DOCKEREXE} exec php bash

tests: ## runs some basic tests
	docker-compose${DOCKEREXE} build