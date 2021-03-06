@echo off
echo "Initializing KGrid Library with the knowledge objects from the shelf"

curl --request POST "http://localhost:8081/login" -Fusername=admin@kgrid.org -Fpassword=admin123 --cookie-jar store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4jh3tk9s" -d "@./activator/shelf/99999-fk4jh3tk9s" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4n87hh26" -d "@./activator/shelf/99999-fk4n87hh26" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk41g0zc28" -d "@./activator/shelf/99999-fk41g0zc28" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4474n87d" -d "@./activator/shelf/99999-fk4474n87d" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4571p57h" -d "@./activator/shelf/99999-fk4571p57h" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4805c32z" -d "@./activator/shelf/99999-fk4805c32z" -H "Content-Type: application/json" --cookie store
curl --request POST "http://localhost:8081/logout" --cookie store
