#!/bin/bash

# Update and install Docker
sudo apt update
sudo apt install -y docker.io

# Start Docker service
sudo systemctl start docker

# Clone the GitHub repository
git clone https://github.com/1isa12/dockerized-webapp.git
cd dockerized-webapp

# Build and run the Docker container
docker build -t node-docker-app .
docker run -p 3000:3000 node-docker-app
