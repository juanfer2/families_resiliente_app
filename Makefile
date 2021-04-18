# Path for caching docker layers
LAYERS_PATH=/home/circleci/docker-caches
# File where docker images layer ids are stored
LAYERS_LIST_FILE=all_layers.txt
VPS_USER?=deploy
VPS_HOST?=ayenda-staging-webserver
RELEASE_FOLDER?=/var/www/ayenda

# Run server
run:
	rails s -p 8000

docker-run:
	docker-compose up

# Configuration
copy-config:
	cp config/database.yml.example config/database.yml
	cp config/application.yml.example config/application.yml
	cp config/sidekiq.yml.example config/sidekiq.yml
	cp config/master.key.example config/master.key
	cp config/credentials.yml.enc.example config/credentials.yml.enc
	cp config/third_keys/puntos_colombia.p12.example config/third_keys/puntos_colombia.p12
	cp config/config_files/google_desktop_config.json.example config/config_files/google_desktop_config.json
	cp public/openexchangerates_cache.json.example public/openexchangerates_cache.json
	mkdir -p tmp/viajala

docker-copy-config:
	sed 's/host: localhost/host: db/g' config/database.yml.example > config/database.yml
	sed 's/:3000/:8000/g' config/application.yml.example > config/application.yml
	cp config/sidekiq.yml.example config/sidekiq.yml
	cp config/master.key.example config/master.key
	cp config/credentials.yml.enc.example config/credentials.yml.enc
	cp config/third_keys/puntos_colombia.p12.example config/third_keys/puntos_colombia.p12
	cp config/config_files/google_desktop_config.json.example config/config_files/google_desktop_config.json
	cp public/openexchangerates_cache.json.example public/openexchangerates_cache.json
	mkdir -p tmp/viajala

copy-linked-files:
	ssh -oStrictHostKeyChecking=no $(VPS_USER)@$(VPS_HOST) 'mkdir -p $(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/public/'
	ssh -oStrictHostKeyChecking=no $(VPS_USER)@$(VPS_HOST) 'mkdir -p $(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/config/third_keys'
	scp public/openexchangerates_cache.json $(VPS_USER)@$(VPS_HOST):$(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/public/openexchangerates_cache.json
	scp config/third_keys/puntos_colombia.p12.example $(VPS_USER)@$(VPS_HOST):$(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/config/third_keys/puntos_colombia.p12
	scp config/master.key $(VPS_USER)@$(VPS_HOST):$(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/config/master.key
	scp config/database.yml $(VPS_USER)@$(VPS_HOST):$(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/config/database.yml
	mkdir -p tmp $(VPS_USER)@$(VPS_HOST):$(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/tmp
	mkdir -p tmp/viajala $(VPS_USER)@$(VPS_HOST):$(RELEASE_FOLDER)/servers/$(SERVER_FOLDER)/shared/tmp/viajala

# Docker scripts
docker-build-assets:
	docker-compose run server rails db:create
	docker-compose run server bundle exec rails assets:precompile

docker-rubocop-comments:
	docker-compose run server bundle exec pronto run -f github_pr -c origin/master

load-docker-cache:
ifneq ("$(wildcard $(LAYERS_PATH))","")
	gunzip -c $(LAYERS_PATH)/${CIRCLE_PROJECT_REPONAME}.tar.gz | docker load;
	docker images;
else
	mkdir -p $(LAYERS_PATH)
endif

save-docker-cache:
ifeq ("$(wildcard $(LAYERS_PATH)/$(LAYERS_LIST_FILE))","")
	docker history -q ayenda/server-dev > $(LAYERS_PATH)/all_layers.txt;
	sed '/<missing>/d' $(LAYERS_PATH)/all_layers.txt > $(LAYERS_PATH)/layers.txt;
	docker save `cat $(LAYERS_PATH)/layers.txt` | gzip > $(LAYERS_PATH)/${CIRCLE_PROJECT_REPONAME}.tar.gz;
endif

# Testing
docker-test:
	docker-compose run server rails db:create
	docker-compose run server bundle exec rspec --profile 10 --out test_results/rspec.xml --format progress
