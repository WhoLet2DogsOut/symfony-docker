# Prerequisites
```
# go to your projects folder, open terminal and run:
git clone https://github.com/dunglas/symfony-docker.git
cd symfony-docker
docker compose build --no-cache
XDEBUG_MODE=debug docker compose up -d --force-recreate
```

Now it should work (they just have a certificate there, so ignore it)

Open: [https://localhost/](https://localhost/)


# Basic Commands

```
# name of services
docker-compose config --services

# you should see PHP 8.3 version
docker-compose exec php php --version

# check options
docker-compose exec php bin/console

# check routes
docker-compose exec php bin/console debug:router
```

Okay, now let's install maker bundle. Docs is here [https://symfony.com/bundles/SymfonyMakerBundle/current/index.html](https://symfony.com/bundles/SymfonyMakerBundle/current/index.html)

```
docker-compose exec php composer require symfony/maker-bundle --dev

# https://symfony.com/doc/current/controller.html
docker-compose exec php bin/console make:controller ExampleController
```

and check it in browser [https://localhost/example](https://localhost/example)



# Documentations
- Symfony [MOST IMPORTANT] https://symfony.com/doc/current/index.html
- Composer https://getcomposer.org/doc/
- .editorconfig https://editorconfig.org/
- Makefile what's .PHONY https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html



# Unit tests
https://symfony.com/doc/6.2/the-fast-track/en/17-tests.html

```
docker-compose exec php composer require phpunit/phpunit --dev

docker-compose exec php bin/console make:test TestCase ExampleTest

docker-compose exec php php ./vendor/bin/phpunit
```

# Problem with permissions?
```
docker exec -it symfony-docker-php-1 /bin/sh
docker-compose run --rm php chown -R 1000:1000 .

# docker-compose run --rm php chown -R $(id -u):$(id -g) .
```





