HOSTNAME = sbalk.42.fr
LOCAL_IP = 127.0.0.1
WEBSITE_DIR = $(HOME)/data/website
DATABASE_DIR = $(HOME)/data/database


all:
	@echo "Usage: make [start|stop|clean]"


start: setup
	echo "Starting services"
	mkdir -p $(WEBSITE_DIR)
	docker-compose -f srcs/docker-compose.yml up -d

setup:
	@echo "Setting up host redirection..."
#	@set -e; \
#	@grep -qxF "$(LOCAL_IP) $(HOSTNAME)" /etc/hosts || (echo "$(LOCAL_IP) $(HOSTNAME)" | sudo tee -a /etc/hosts > /dev/null) \
	@echo "Setup done"

stop:
	docker-compose -f srcs/docker-compose.yml down

clean: stop
	@echo "Cleaning up host redirection..."
	rm -rf $(WEBSITE_DIR)
	# sudo sed -i '' "/$(LOCAL_IP) $(HOSTNAME)/d" /etc/hosts
	@docker container rm -f nginx wordpress mariadb
	@echo "Clean done"

show: 
	@echo "Services status"
	docker-compose -f srcs/docker-compose.yml ps