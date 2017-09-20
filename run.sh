#!/bin/bash

docker run -d -p 9000:9000 --name pig -h pig --net cloud.com sumit/pig:latest /etc/bootstrap.sh -d


