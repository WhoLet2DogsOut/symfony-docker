#.PHONY: .tmp
#.tmp:
#	mkdir -p .tmp/phpcs .tmp/phpstan .tmp/phpstan-di .tmp/phpstan-di-tests .tmp/phpunit .tmp/xdebug

up-force:
	#docker compose pull
	#docker compose build --pull
	XDEBUG_MODE=debug docker compose up -d --force-recreate --remove-orphans
	#docker compose exec php composer install --no-interaction

reload:
	docker compose up -d --force-recreate

down-force:
	docker compose down -v --remove-orphans

up:
	XDEBUG_MODE=debug docker compose up -d

down:
	docker compose down --remove-orphans


php-unit:
	docker-compose exec php php ./vendor/bin/phpunit
