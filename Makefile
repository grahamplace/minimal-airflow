.PHONY: clean-pyc clean-build

setup_pyenv:  ## Create virtual env and install dependencies
	pip install virtualenv
	virtualenv airflow_env
	source airflow_env/bin/activate && SLUGIFY_USES_TEXT_UNIDECODE=yes pip install -r requirements.txt

setup_airflow:  ## Setup airflow, init metadata db
	source airflow_env/bin/activate \
	&& export AIRFLOW_HOME=~/minimal-airflow \
	&& airflow initdb

start_airflow:
	source airflow_env/bin/activate \
	&& export AIRFLOW_HOME=~/minimal-airflow \
	&& airflow webserver -p 8080 -D \
	&& airflow scheduler -D
