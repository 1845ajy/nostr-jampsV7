#!/bin/bash

#This bash script is the best way to run and stop several reelays at the same time. 


# Run pyrelay's compose file first 
docker-compose -f pyrelay-master/docker-compose.yml up -d

# If you have added more relays with their own docker compose file it is advisable to run them here as the above example

# Run your main compose file
docker-compose up -d

exit 0