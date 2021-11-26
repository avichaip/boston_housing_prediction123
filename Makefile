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
	circleci local execute

lint:
	hadolint setup-demo/Dockerfile
	pylint --disable=R,C,W1203 setup-demo/**.py

all: create install lint
