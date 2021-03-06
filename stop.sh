# Stop basic HTTP app
cd ./http-app;
docker-compose down;

# Stop and cleanup the prefab generated files
cd ../prefabbed-app;
docker-compose down;
docker volume rm prefabbedapp_app;
git clean -dxf;


if [[ $OSTYPE == darwin* ]]; then
  cd ../dnsmasq;
  docker-compose down
fi

# Stop and clean up the Traefik deployment
cd ../traefik;
docker-compose down;
