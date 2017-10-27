#!/usr/bin/env bash


vagrant up
./start.sh

# initialize the library with the objects from the shelf

curl -XPOST http://localhost:8081/login -Fusername=admin@kgrid.org -Fpassword=admin123 --cookie-jar boo
curl -XPUT "localhost:8081/knowledgeObject/99999-00000" -d "./activator/shelf/99999-fk4ff41k51.json" -H "Content-Type: application/json" --cookie boo
# ...

./stop.sh
vagrant halt

