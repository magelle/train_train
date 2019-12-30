#!/bin/zsh

# sudo docker run --name train_train_postgres -e POSTGRES_PASSWORD=traintrain -p 5432:5432 -d postgres
sudo systemctl start docker.service
sudo docker start train_train_postgres
