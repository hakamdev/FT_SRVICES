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
docker build -t x_wordpress srcs/wordpress/;
docker build -t x_mysql srcs/mysql/;
docker build -t x_phpmyadmin srcs/phpmyadmin/;
docker build -t x_nginx srcs/nginx/;
docker build -t x_influxdb srcs/influxdb/;
docker build -t x_ftps srcs/ftps/;
docker build -t x_grafana srcs/grafana/;

# Creating Deployments & Services for Images
kubectl apply -f srcs/mysql/dep-mysql.yml;
kubectl apply -f srcs/wordpress/dep-wp.yml;
kubectl apply -f srcs/phpmyadmin/dep-pma.yml;
kubectl apply -f srcs/nginx/dep-nginx.yml;
kubectl apply -f srcs/influxdb/dep-influxdb.yml;
kubectl apply -f srcs/ftps/dep-ftps.yml;
kubectl apply -f srcs/grafana/dep-grafana.yml;

clear;
minikube dashboard &
