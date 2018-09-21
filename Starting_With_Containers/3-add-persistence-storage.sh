# Add storage
docker volume ls
docker volume create data
docker volume ls
docker run -p 80:80 --name webserver -d -v data:/data httpd
docker inspect webserver
docker exec -it webserver /bin/bash

# Adding files to container's "data" folder
cd /data
echo "Created from the web container" > data.txt
exit

# Kill the container and launching a new one
docker rm -f webserver
docker run -it --rm -v data:/data busybox /bin/sh
# Add volume from an existing directory
mkdir htdocs
docker run -p 80:80 --name webserver -d -v $PWD/htdocs:/usr/local/apache2/htdocs httpd
docker exec -it webserver /bin/bash

# Run these commands within the container
cd /usr/local/apache2/htdocs
echo '<h1>Hello World from Container</h1>' > index.html
exit
curl localhost
# We can not only access this file from the host, but we can also modify it:
cd htdocs
cat index.html
echo '<h1>Hello World from Host</h1>' | sudo tee index.html >/dev/null
curl localhost

# Terminate the container
docker rm -f web