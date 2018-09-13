## Mysql Docker image

***Note: This docker image requires *docker network running* to link other containers and add after "docker run --net=NameDockerLan"***


# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t brpedromaia/mysql:latest mysql/ 
```
# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull brpedromaia/mysql
``` 

# Start a container

To use the Docker image you have just build or pulled use:

```
docker run -itd --hostname=mysql --name=mysql brpedromaia/mysql
```

To enter in container

```
docker exec -it mysql bash
```

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

```
docker run -it --hostname=mysql --name=mysql brpedromaia/mysql -bash
```

**You would like to have a tunnel port exposed to localhost.**

```
docker run -itd  --hostname=mysql --name=mysql -p3306:3306 brpedromaia/mysql
```

# Testing

You can run one of the stock examples:

```
mysql -uroot -pmysqlPassword -e "select user, host FROM mysql.user;"
```

# Client config 
```
hostname: localhost
port: 3306
username: hive
password: hive
```

# Automate everything

To automate everything add code into "__start_mysql" function on mysql-configuration.sh 
