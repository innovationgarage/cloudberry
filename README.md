# The Cloudberry project
This project aims to simplify setting up OpenWRT, OpenWISP and OpenVPN for different use cases. In particular, it makes it
easy to set up RaspberryPI based VPN clients that connect to a dockerized VPN server to route traffic between each other.

For more information on how to set up the RPi devices and how the components work, please see the [project wiki](https://github.com/innovationgarage/cloudberry/wiki).

## Main components

* [djangoproject](https://github.com/innovationgarage/cloudberry-djangoproject) - Centralized configuration web UI 
* [docker-manager](https://github.com/innovationgarage/cloudberry-docker-manager) - OpenWISP front-end to docker
* [lede-openwisp-docker](https://github.com/innovationgarage/cloudberry-lede-openwisp-docker) - OpenWISP docker image

## Library projects (semi-unrelated)
* [netjson](https://github.com/innovationgarage/cloudberry-netjson) - netjson extension schemas
* [SakStig / SakForm](https://github.com/innovationgarage/sakstig) - JSON query and templating language
