# Launch Apache webserver
docker run -p 80:80 -d --name webserver httpd

# Modify the container
docker exec -it webserver /bin/bash
cd /usr/local/apache2/htdocs
echo '<h1>Welcome to my web application</h1>' > index.html
exit

# Stop the container
docker stop webserver

# Commit the container to a new image
docker images
docker commit webserver doweb
docker tag webserver sai123wiwo/doweb
docker images

# Push the new image to Docker Hub
docker login
docker push sai123wiwo/doweb

# Clean up
docker rmi -f httpd

# Import and export images
docker pull busybox
# Export busybox image
docker save busybox > busybox.tar
# Import busybox image
docker load < busybox.tar