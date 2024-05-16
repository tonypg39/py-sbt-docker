- first docker build

ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied

fix by tony: add docker to the sudo group
* Add the docker permission group (if it's not created already)
  `sudo groupadd docker`
  `sudo usermod -a -G docker $MY_USER` # change $NY_USER with the actual user

```docker build . -t pysbt-sim:latest```

- run the image, we do not run it normally since we need the graphical interfaces

```chmod +x gui-docker```

```./gui-docker --name sbt pysbt-sim sleep infinity &```
```/gui-docker --name sbt --network host pysbt-sim sleep infinity &```

```docker exec -it sbt bash```

```sudo apt-get install nano xterm``` if xterm is not found
fixing xhost stuff: ```xhost +Local:*```, ```xhost```

``sudo apt-get install ros*controller*```