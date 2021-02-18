apk --no-cache update;
apk --no-cache add nginx;
apk --no-cache add openrc;
apk --no-cache add openssh;
apk --no-cache add openssl;

rc-status
rc-update add nginx;
rc-update add sshd;

adduser -D hakam;
echo hakam:hakam | chpasswd; 

mkdir /var/www/html;
mv index.html /var/www/html/
chmod 755 /var/www/html;
chown -R nginx: /var/www/html;
rm -rf /etc/nginx/nginx.conf;
mv nginx.conf /etc/nginx/;
chown -R nginx: /etc/nginx/nginx.conf;
chmod 755 /etc/nginx/nginx.conf;
mkdir /run/nginx/;

# mv      localhost.crt /etc/ssl/certs/
# mv      localhost.key /etc/ssl/private/
openssl req -nodes -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -subj "/C=MA/ST=Bg/L=Benguerir/O=1337/OU=ComputerScience/CN=www.hakamdev.com"
chown	-R nginx: /etc/ssl/private/localhost.key
chown	-R nginx: /etc/ssl/certs/localhost.crt