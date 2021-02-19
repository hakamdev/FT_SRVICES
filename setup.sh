#!/bin/zsh
minikube delete;
minikube start --driver=virtualbox;
# Installing Metallb LoadBalancer
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Metallb already comes with Minikube as an addon, so there is no need to Deploy it using Kubectl
# because sometimes it doesn't get pulled by Docker!
minikube addons enable metallb;
kubectl apply -f metallb/metallb-config.yml;

# Configuring Docker and Building Images
eval $(minikube docker-env);
docker build -t x_wordpress wordpress/;
docker build -t x_mysql mysql/;
docker build -t x_phpmyadmin phpmyadmin/;
docker build -t x_nginx nginx/;
docker build -t x_influxdb influxdb/;
docker build -t x_ftps ftps/;

# Creating Deployments & Services for Images
kubectl apply -f mysql/dep-mysql.yml;
kubectl apply -f wordpress/dep-wp.yml;
kubectl apply -f phpmyadmin/dep-pma.yml;
kubectl apply -f nginx/dep-nginx.yml;
kubectl apply -f influxdb/dep-influxdb.yml;
kubectl apply -f ftps/dep-ftps.yml;

clear;
minikube dashboard &
