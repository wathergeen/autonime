RUNNER_COMMAND=poetry run

.PHONE: format, clear, test, lint

dev:
	@ echo Running development apllication
	cd src && ${RUNNER_COMMAND} python manage.py runserver 0.0.0.0:8080

run:
	# WEB_CONCURRENCY=4
	@ echo Running production apllication
	sh docker/production/entrypoint.sh

tests:
	@ echo Runnig tests
	cd src && ${RUNNER_COMMAND} python manage.py test -v 3 --keepdb --settings=test_settings --nomigrations

migrate:
	@ echo Execute non applied migrations
	cd src && ${RUNNER_COMMAND} python manage.py migrate

migrations:
	@ echo Generete migration files
	cd src && ${RUNNER_COMMAND} python manage.py makemigrations
