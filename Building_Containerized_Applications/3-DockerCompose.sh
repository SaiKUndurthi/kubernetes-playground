# Installing docker-compose
sudo apt-get install -y docker-compose

#Go to the directory where your docker-compose.yaml is located. It pulls the images and launch the containers
# In to-do app go to /compose
docker-compose up -d
docker ps
#You should see compose_todonet
docker network ls

# To check the container logs 'docker log <container-name>'
docker log db 
docker-compose logs

# Scale your instances
docker-compose scale web=20