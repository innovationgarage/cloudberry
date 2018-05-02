vm: clean
	# Make sure we have the latest changes
	git submodule update --recursive --remote
	vagrant up

clean:
	-vagrant destroy -f
