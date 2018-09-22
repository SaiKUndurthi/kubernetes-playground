# Setting up DckerHub Username
export HUB_USER=sai123wiwo

# Check images
docker images
# Move to the directory
cd hellowhale
# Build the docker image
docker build -t $HUB_USER/hellowhale .
# Check images
docker images
# Run the container
docker run -d -p 8080:80 --name hello-whale  $HUB_USER/hellowhale
# check the webpage
curl localhost:8080
# Access the shell
docker exec -it hello-whale /bin/bash
# Check the files and folders
ls

#Cleanup
docker stop hello-whale
docker rm hello-whale
docker rmi $HUB_USER/hellowhale