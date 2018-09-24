# List available networks
docker network ls

# Create a custom network
docker network create --driver bridge my_web_app

# Launch a web container on the custom network
docker run -d -p 80:80 --network=my_web_app --name web --hostname web httpd

# Launch client container
docker run -it --rm --name client --network=my_web_app --hostname client yauritux/busybox-curl /bin/sh

# Run the ping and curl to test if you can talk to web
ping web
curl web

# Clean up
docker rm -f web 
docker network remove my_web_app
docker rmi -f yauritux/busybox-curl
docker rmi -f httpd