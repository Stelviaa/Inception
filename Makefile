.PHONY: up down logs

up:
	docker-compose -f srcs/docker-compose.yml up -d

clean:
	docker-compose -f srcs/docker-compose.yml down

re: clean up

logs:
	docker-compose logs -f
