#Log in to Docker hub. You should set up an account in Docker hub first.
docker login

#Copy "dockerfile" and "hello-world.jar" in a folder and run the command below from that directory to build the image. 
#Substiture "<your_dockerHub_id>" with your Docker hub ID:
docker image build --tag <your_dockerHub_id>/hello-world-app:1.0.0 .

#View images
docker images

#Run the container   
docker run -d --name hello-world  -p 8080:8080 <your_dockerHub_id>/hello-world-app:1.0.0
    curl http://localhost:8080/computer

#Start a second container
docker run -d --name hello-world1  -p 8081:8080 <your_dockerHub_id>/hello-world-app:1.0.0
    curl http://localhost:8081/computer

#sh to container1. When you run a container, it displays teh container id (see above), get the first few chars and substitute below: 
docker exec -it <container_id> sh
    #Get OS distro version
    cat /etc/os-release
    #Call the service hosted on the second container. When you executed "curl http://localhost:8081/computer", it dispayed the IP address
    #of the container, grab it and substitute below:
    curl <other_container_IP_address>:8080/greetings

#Push the image to Docker Hub
docker push <your_dockerHub_id>/hello-world-app:1.0.0

#Docker system wide  info
docker info

#List the images in the local docker repo
docker images

#What containers are running
docker ps  -a

#Stop a container. Grab a container id from "docker ps"
docker stop <container_id>

#Start a container
docker start <container_id>

#Delete a container
docker rm <container_id> -f

#Delete an image from the local docker repo
#docker rmi  <your_dockerHub_id>/hello-world-app:1.0.0 -f