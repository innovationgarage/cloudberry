vm: clean
	# Make sure we have the latest changes
	git submodule update --recursive --remote
	vagrant up

clean:
	-vagrant destroy -f

# Meant to be run inside VM to make the Django app reachable.
run:
	python3 cloudberry-djangoproject/manage.py runserver 0.0.0.0:8000
