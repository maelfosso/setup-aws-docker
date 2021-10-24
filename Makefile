setup:
	python3 -m venv ~/.setup-aws-docker

install:
	pip install --no-cache-dir --upgrade pip &&\
		pip install --no-cache-dir -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute

linter:
	hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test
