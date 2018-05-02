# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

  config.vm.network "forwarded_port", guest: 80, host: 8000

  config.vm.synced_folder ".", "/srv/www", type: "rsync"

  # Provision script installs the dependencies for the django project.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL

	sudo DEBIAN_FRONTEND=noninteractive apt-get update
	sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip

        export CLOUD_BERRY_DIR=/srv/www/cloudberry-djangoproject

        # Disable annoying upgrade message
        pip3 --disable-pip-version-check install -r ${CLOUD_BERRY_DIR}/requirements.txt

	python3 ${CLOUD_BERRY_DIR}/manage.py migrate
	python3 ${CLOUD_BERRY_DIR}/manage.py collectstatic

        # Set the default directory
        echo "cd /srv/www/cloudberry-djangoproject/" >> ~/.bashrc
  SHELL
end
