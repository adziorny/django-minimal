# django-minimal
This repo provides code for a minimal "Hello World" Django-based docker container.

To build you need docker-compose installed on your Windows or Linux machine. Navigate to the repo directory and build using the following command:

```
docker-compose build python
```

The service name inside the `docker-compose.yml` file is `python` and this tells the executable `docker-compose` which service to build. That Yaml file specifies the `Dockerfile` to use, which tells docker what to do. This test container grabs a base Python build, updates the linux base, adds PIP modules, creates a directory and copies over the minimal django script, exposes the port and sets the default command. 

Once build, you can run the image using the following command:

```
docker-compose up -d python
```

The `-d` tag specifies to create this container as a daemon process. Check out what is running using the following command:

```
docker ps -a
```

This shows all docker containers started, running and exited. If it shows your test container running, navigate your web browser to the host machine and port `5800` and you should see the `Hello World` message. If the container is not running, use the docker command `docker logs <container-id>` with the container ID found by running the `ps` command above to view what is going on inside the contianer.

