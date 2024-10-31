setup:
	@make build
	@make up
	@make composer-update
	@make data
	docker exec backend bash -c "cp .env.example .env"

build:
	docker compose build --no-cache --force-rm
stop: 
	docker compose stop
up:
	docker compose up -d
composer-update:
	docker exec backend bash -c "composer update"
data:
	docker exec backend bash -c "php artisan migrate"
	docker exec backend bash -c "php artisan db:seed"

down:
	docker compose down
