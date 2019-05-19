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
	docker-compose${DOCKEREXE} up --force-recreate --build -d
	
down: ## downs the composition
	docker-compose${DOCKEREXE} down

bash: ## bash script to various services
	docker-compose${DOCKEREXE} exec php bash

tests: up # runs some basic tests

wipe: down ## wipes the generated dirs
	rm -rf etc/admin/app/vendor/
	rm -rf etc/pwa/app/node_modules/

admin-bash: ## can i get bash up in there?
	docker-compose${DOCKEREXE} run admin bash

admin-build: ## runs the admin build scripts
	docker-compose${DOCKEREXE} run admin /srv/bin/build

pwa-bash: ## can i get bash up in there?
	docker-compose${DOCKEREXE} run pwa bash

pwa-build: ## runs the pwa build scripts
	docker-compose${DOCKEREXE} run pwa /srv/bin/build