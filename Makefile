.PHONY: up down logs

up:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f srcs/docker-compose.yml down
re: clean up

logs:
	docker-compose -f srcs/docker-compose.yml logs -f
