.PHONY: all
all: deploy-app

# When run locally DOCKER_TAG won't be set so we should create it
# When run in Jenkins the Jenkinsfile defines this appropriately
setup:
ifndef DOCKER_TAG
DOCKER_TAG = "localtest-$(shell git rev-parse --short HEAD)"
endif

#AWS_ACCESS_KEY = AKIAJHQROJMAN6ILEE5Q
#AWS_SECRET_KEY = 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

build-app: setup
	echo "build world"

test-app: setup
	echo "test world"

deploy-app: setup
	echo "deploy world"



app-docker-build: setup
	docker build -f Dockerfile.test -t $(DOCKER_TAG) 
	docker run --rm $(DOCKER_TAG)


app-docker-test: setup
	docker build -f Dockerfile.test -t $(DOCKER_TAG) 
	docker run --rm $(DOCKER_TAG)
