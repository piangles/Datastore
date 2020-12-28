#!/bin/bash

docker stop piangles_db

docker image build -t piangles_db .

docker container run -p 5432:5432 --rm -it --name piangles_db piangles_db 

sleep 5

docker ps