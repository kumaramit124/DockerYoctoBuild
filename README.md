# DockerYoctoBuild
This is Docker Yocto build configuration. 

Pre-requisites -
Install the docker in Unbuntu. 
https://docs.docker.com/get-docker/

# First build docker
Run the below command
 -  docker build -t yocto-compile:latest --build-arg USERNAME=dev --build-arg PUID=1000 --build-arg PGID=1000  .

# Yocto build steps
Go to the directory
 -  cd yocto
Sync the yocto project specify the branch
 -  ./StartBuild.sh sync qemuarm warrior
Start the compilation with the command
 -  ./StartBuild.sh all
