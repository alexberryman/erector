cd ./http-app;
docker-compose down;
cd ../prefabbed-app;
docker-compose down;
docker volume rm prefabbedapp_app;
sudo chmod 777 -R .;
git clean -dxf;
cd ../traefik;
docker-compose down;
