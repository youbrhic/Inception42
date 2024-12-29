
run :
	docker compose -f ./srcs/docker-compose.yml up --build

stop :
	docker compose -f ./srcs/docker-compose.yml down

remove : stop
	@docker rm $(docker ps -qa)
	@docker volume rm $(docker volume ls -q)
	@docker rmi $(docker images -qa)