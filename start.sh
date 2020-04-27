# Launch Traefik to allow individual HTTP services to register themselves
cd ./traefik;
docker-compose up -d;
# View http://localhost:8080/dashboard/#/ to see all the routers and services

# Setup a resolver for *.localhost domain if on macOS
if [[ $OSTYPE == darwin* ]]; then
  sudo mkdir -p /etc/resolver;
  sudo tee /etc/resolver/localhost >/dev/null <<EOF
nameserver 127.0.0.1
EOF
  cd ../dnsmasq;
  docker-compose up -d
fi

# Launch a basic web service since it's simpler to understand than nginx+PHP-FPM
cd ../http-app;
docker-compose up -d;
# Request via http://whoami.localhost/

# Launch a Prefabbed nginx+PHP-FPM
cd ../prefabbed-app;
docker-compose build php-fpm;
docker-compose up -d;
docker-compose exec php-fpm composer install;
docker-compose exec php-fpm vendor/bin/phinx migrate;
docker-compose exec php-fpm vendor/bin/phinx seed:run;
docker-compose exec php-fpm vendor/bin/prefab;
# Request via cookies.localhost with searchCriteria
