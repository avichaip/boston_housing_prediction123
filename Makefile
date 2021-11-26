setup:
	python3 -m venv setup_env
	source setup_env/bin/activate

install:
	pip3 install --upgrade pip &&\
		pip3 install -r requirements.txt

validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute

lint:
	hadolint setup-demo/Dockerfile
	pylint --disable=R,C,W1203 setup-demo/**.py

all: install lint
