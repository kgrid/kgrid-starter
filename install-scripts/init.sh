#!/usr/bin/env bash

# initialize the fedora repo and start it
# initialize the library with the objects from the shelf

cd ..
start.sh

curl -XPOST http://localhost:8081/login -Fusername=admin@kgrid.org -Fpassword=admin123 --cookie-jar boo
curl -XPUT "localhost:8080/knowledgeObject/99999-fk4ff41k51" -d "./activator/shelf/99999-fk4ff41k51.json" -H "Content-Type: application/json" --cookie boo
# ...

stop.sh
popd
