cd ./traefik;
docker-compose up -d;
cd ../http-app;
docker-compose up -d;
cd ../prefabbed-app;
docker-compose build php-fpm
docker-compose up -d;
docker-compose exec php-fpm composer install;
docker-compose exec php-fpm vendor/bin/phinx migrate;
docker-compose exec php-fpm vendor/bin/phinx seed:run;
sudo chmod 777 -R .
docker-compose exec php-fpm vendor/bin/prefab;
sudo chmod 777 -R .
