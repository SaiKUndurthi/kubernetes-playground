# Command to search for docker images
docker search hello-world

# Pull hello-world image
# Provides a list of docker images on the host 
docker images
docker run hello-world
docker images

# Run Apache webserver container
docker run -p 80:80 --name webserver -d httpd
docker ps
# Now access the web server
curl localhost
# OUTPUT - <html><body><h1>It works!</h1></body></html>
docker stop webserver
docker rm webserver
docker ps