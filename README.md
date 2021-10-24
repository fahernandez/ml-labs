# How to use this project
1. Install [docker](https://docs.docker.com/engine/install/)
2. Install [docker-compose](https://docs.docker.com/compose/install/)
3. Add your linux user to the docker user group (this will allow you execute docker commands without root permissions)
```bash
sudo usermod -aG docker ${USER}
```
5. Execute the image.
```bash
cd ~/Documents/Nottingham/ML/ml-labs/;xhost +;docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro --shm-size=512M -v "$(pwd)":/home/matlab/MATLAB/Projects/ mathworks/matlab:deb-1
```
7. The MATLAB desktop window should open on your machine. Note that the command above works only on a Linux operating system with X11 and its dependencies installed.
8. Enyoy!

## More about the installation
1. You can save the state of the container by committing it after installing packages or making updates. Follow this guide https://uk.mathworks.com/help/cloudcenter/ug/save-changes-in-containers.html.
```bash
docker ps
docker commit 844f29a058e8 mathworks/matlab:deb-#
```

## Image Version track
1. Commit deb-1
    1. Initial container version