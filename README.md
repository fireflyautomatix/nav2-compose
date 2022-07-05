# nav2-compose
Compose setup for testing nav2

Prerequisites:
- Docker compose 1.29

Run with
```
docker-compose up --build
```

or if you want to build with Buildkit:

```
docker buildx bake -f compose.yml
docker-compose up
```

## iceoryx
You can run the iox-introspection client by running something like:
```
docker run -it nav2-compose_nav2_1 /ros_entrypoint.sh iox-introspection-client --all
```