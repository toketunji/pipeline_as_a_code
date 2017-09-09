.PHONY: all
all: deploy-test

# When run locally DOCKER_TAG won't be set so we should create it
# When run in Jenkins the Jenkinsfile defines this appropriately
setup:
ifndef DOCKER_TAG
DOCKER_TAG = "localtest-$(shell git rev-parse --short HEAD)"
endif

#AWS_ACCESS_KEY = AKIAJHQROJMAN6ILEE5Q
#AWS_SECRET_KEY = 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

deploy-test: setup
	echo "hello world"
