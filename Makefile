build:
	@docker build -t eggybytes/ci-base:bazelisk bazelisk/.

push:
	@docker push eggybytes/ci-base:bazelisk
