#!/bin/bash

docker stop piangles

docker image build -t piangles .

docker container run -p 5432:5432 --rm -it --name piangles piangles 

sleep 5

docker ps