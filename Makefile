##TEMPLATING template=makefile_faas
include ENV

DOCKER_NAMESPACE=nouchka

.DEFAULT_GOAL := build
.PHONY: build

run:
	docker run --rm --entrypoint sh $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE) -c "echo $(TEST_FUNC)|/usr/bin/$(DOCKER_IMAGE)"

build:
	faas-cli build -f $(DOCKER_IMAGE).yml

invoke:
	echo $(TEST_FUNC)|faas-cli invoke -f $(DOCKER_IMAGE).yml $(DOCKER_IMAGE)

rm:
	faas-cli remove -f $(DOCKER_IMAGE).yml
	docker rmi -f $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE)
	sleep 5

deploy:
	faas-cli deploy -f $(DOCKER_IMAGE).yml
	sleep 10

test: rm build deploy invoke

docker-test: build run
##TEMPLATING
