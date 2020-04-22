# Erector
Replace the brick foundation of Mason with the automation of an *Erected* steel factory.

## Design
Run a [Traefik](https://containo.us/traefik/) router that allows other `docker-compose.yml` deployment to register themselves.

This is accomplished by creating a docker network named `traefik_web`, and then specifying that external network from other projects.

Once the application containers are on the Traefik network, they define how their incoming requests need to be routed to reach them:
```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.prefabbed.rule=Host(`cookies.localhost`)"
  - "traefik.http.routers.prefabbed.entrypoints=web"
  - "traefik.docker.network=traefik_web"
```

These labels from the Prefabbed App example define a router name `prefabbed`, and an expected host name of http://cookies.localhost. This use of labels allows for a composition of services instead of a central dependency on an all-knowing nginx deployment.

## Setup
Use PHPStorms shell and docker integrations to run `start.sh` which will launch Traefik, and two HTTP services:
- Traefik dashboard: http://localhost:8080/dashboard/#/
- Simple HTTP service: http://whoami.localhost/
- Prefabbed HTTP service (nginx+PHP-FPM:7.4): [http://cookies.localhost with searchCriteria](http://cookies.localhost/v1/cookie/?searchCriteria[filters][0][glue]=and&searchCriteria[filters][0][field]=delicious&searchCriteria[filters][0][condition]=eq&searchCriteria[filters][0][values][0]=true)

You can also test requests via HTTP client integrated with PHPStorm using the included `resuests.http` file.

## Teardown
Run `stop.sh` to `docker-compose down` all the different projects and remove the Prefab generated files.

