# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 8000, host: 8000

  config.vm.synced_folder ".", "/srv/www", type: "rsync"

  # Provision script installs the dependencies for the django project.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive 
        export CLOUD_BERRY_DIR=/srv/www/cloudberry-djangoproject

	sudo apt-get update
        sudo apt-get install -y python3 python3-pip \
        apt-transport-https ca-certificates wget    \
        software-properties-common curl tmux vim htop

        # Disable annoying upgrade message
        pip3 --disable-pip-version-check install -r ${CLOUD_BERRY_DIR}/requirements.txt

	python3 ${CLOUD_BERRY_DIR}/manage.py migrate
	python3 ${CLOUD_BERRY_DIR}/manage.py collectstatic

        # Set the default directory
        echo "cd /srv/www/cloudberry-djangoproject/" >> ~/.bashrc

        # Install docker
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   	$(lsb_release -cs) \ stable"
        sudo apt-get update
        sudo apt-get install -y docker-ce
  SHELL
end
