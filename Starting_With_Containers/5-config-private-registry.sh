# Run registry
docker run -d -p 5000:5000 --restart=always --name registry -v $PWD/registry:/var/lib/registry registry
docker ps

# Pull busybox from Docker Hub and push it to local registry
docker pull busybox
docker tag busybox localhost:5000/busybox
docker push localhost:5000/busybox

# Pull busybox from local registry
docker rmi -f $(docker images -a -q) #$(docker images -a -q) finds all the images and are quiet
docker images
docker pull localhost:5000/busybox
docker images 