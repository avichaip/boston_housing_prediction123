create:
	python3 -m venv setup_env
	echo "virtual env, setup_env created. Activate it !"

install:
	pip3 install --upgrade pip &&\
		pip3 install -r requirements.txt

validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config validate


run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci config process .circleci/config.yml > process.yml
	circleci local execute -c process.yml
	# circleci local execute

lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 ./**.py

all: create install lint
