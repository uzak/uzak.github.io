# Docker

    docker logs mycontainer_or_id --since 60m 

Docker nemá by defualt nastavený žádný logrotate dockeru! To znamená, že po nějaké době dojde na serveru místo. Je třeba na obou serverech nastavit nějaké omezení, na UMAX serveru jsme měli 100m a 5 logů z5. Myslím že si můžeme dovolit nastavit 1g a 5 logů z5 je nutné to ale udělat a to úpravou/vytvořením souboru:
/etc/docker/daemon.json a doplnit následující obsah:

    {
        "log-driver": "json-file",
        "log-opts": {
            "max-size": "1g",
            "max-file": "5"
        }
    }
    
    sudo systemctl restart docker

    docker inspect --format='{{.LogPath}}' api  # log file

    docker tag 64af79210286 registry.gitlab.com/$TEAM/$PRJ:master-20210119
    docker push !$
    
    docker update --restart=no my-container
    docker update --restart=unless-stopped my-container

set restart policy to no to all running dockers and stop them:

    docker update `docker ps -q` --restart no
    docker kill `docker ps -q`

update an image by editing a running container made from it

    docker exec -it container-name bash
    docker commit container-ID image-name
    
    docker exec -ti influxdb /bin/bash
    
recreate and start a new container:

    docker-compose stop api
    docker-compose create api
    docker-compose start api
    
backup image
    
    docker inspect 663a995010d6
    docker save ad706aa6e03b43d746b9c7f548a77ce5f86e847bced7f96dd578521838a2bc5c > web.docker
    
reload environment variables

    docker-compose up -d

## Basics

    sudo usermod -aG docker $USER

    docker system prune -a
    docker commit $(docker ps -lq) test-image # after changes in an image

    docker save ppc > ppc.tar
    docker load < ppc.tar

    docker build -t ecorp/project/ui .
    docker run -p 8081:80 ecorp/project/ui
    docker run --env-file ./project.env -p 5001:5000 ecorp/project/api run uwsgi --ini config/project.ini
    docker run --env-file ./project.env -p 5000:5000 ecorp/project/api run pipenv run python project.py

    docker login --username=uzak
    docker push TAG
    docker exec -it fc3dbfe13b19 /bin/sh


http://docker-curriculum.com/

    docker run hello-world
    docker pull busybox
    docker images
    docker run busybox ls /etc
    docker ps -a
    docker run -it busybox sh
    docker rm $(docker ps -a -q -f status=exited)
    docker rmi 
    docker run prakhar1989/static-site
    docker run -d -P --name static-site prakhar1989/static-site
    docker port static-site
    docker run -p 8888:80 prakhar1989/static-site
    docker stop 082865c5dc79
    docker container rm 082865c5dc79
    docker container ls

## Images

    docker images
    docker pull ubuntu:12.04
    docker search


## Dockerfile example

    FROM ubuntu:14.04
    MAINTAINER MU <uzak+git@mailbox.org>
    RUN apt-get -yqq update
    RUN apt-get -yqq python-pip python-dev nodejs npm
    RUN ln -s /usr/bin/nodejs /usr/bin/node
    ADD flask-app /opt/flask-app
    WORKDIR /opt/flask-app
    RUN npm install
    RUN npm run build
    RUN pip install -r requirements.txt
    EXPOSE 5000
    CMD ["python", "./app.py"]

    docker build -t uzak/catnip .
    docker run -p 8888:5000 uzak/catnip
    docker login
    docker push uzak/catnip


## Multicontainer setup

    docker search elasticsearch
    docker network ls
    docker network inspect bridge
    docker run -it --rm prakhar1989/foodtrucks-web bash
    docker network create foodtrucks
    docker ps
    docker stop 5d04018ed570
    docker run -dp 9200:9200 --net foodtrucks --name es elasticsearch
    docker run -it --rm --net foodtrucks  prakhar1989/foodtrucks-web bash
    docker run -d --net foodtrucks -p 5000:5000 --name foodtrucks-web prakhar1989/foodtrucks-web


## docker-compose

    version: "2"
    services:
        es:
            image: elasticsearch
        web:
            image: prakhar1989/foodtrucks-web
            command: python app.py
            ports:
                - "5000:5000"
            volumes:
                - .:/code

    docker stop $(docker ps -q)
    docker-compose up
    docker-compose up -d
    docker-compose restart


## Troubleshooting

* Permission denied on host directory: https://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker

* CentOS doesn't allow access from containers to the host by default: [solution](https://forums.docker.com/t/no-route-to-host-network-request-from-container-to-host-ip-port-published-from-other-container/39063/5)

    docker rm $(docker ps -a -f status=exited -q) # remove exited containers
    docker rmi $(docker images -qa)            # remove all images
    
## Links

[Setup a private docker registry](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-18-04)
