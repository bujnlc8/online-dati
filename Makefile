WITH_ENV = env `cat .env 2>/dev/null | xargs`

shell:
	@$(WITH_ENV) python manage.py shell

migrate:
	@$(WITH_ENV) python manage.py db migrate

shell-autoreload:
	@$(WITH_ENV) ipython
