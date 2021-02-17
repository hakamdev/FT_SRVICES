#!/bin/zsh
if [[ $1 != '1' ]]; then
	exit 1
fi
minikube delete
minikube start --driver=virtualbox
# Installing Metallb LoadBalancer #
kubectl		apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl		apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl		create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl		apply -f metallb/metallb-config.yml

# Configuring Docker and Building Images #
eval		$(minikube docker-env);
docker build -t x_wordpress wordpress/
docker build -t x_mysql mysql/
docker build -t x_phpmyadmin phpmyadmin/
docker		build -t x_nginx nginx/

# Creating Deployments & Services for Images #
kubectl		apply -f mysql/dep-mysql.yml
kubectl		apply -f wordpress/dep-wp.yml
kubectl		apply -f phpmyadmin/dep-pma.yml
kubectl		apply -f nginx/dep-nginx.yml
clear;
