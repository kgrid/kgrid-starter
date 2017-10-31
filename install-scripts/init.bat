curl --request POST http://localhost:8081/login -Fusername=admin@kgrid.org -Fpassword=admin123 --cookie-jar store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4jh3tk9s" -d "@./library/shelf_0/99999-fk4jh3tk9s" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4n87hh26" -d "@./library/shelf_0/99999-fk4n87hh26" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk41g0zc28" -d "@./library/shelf_0/99999-fk41g0zc28" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4474n87d" -d "@./library/shelf_0/99999-fk4474n87d" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4571p57h" -d "@./library/shelf_0/99999-fk4571p57h" -H "Content-Type: application/json" --cookie store
curl --request PUT "http://localhost:8081/knowledgeObject/99999-fk4805c32z" -d "@./library/shelf_0/99999-fk4805c32z" -H "Content-Type: application/json" --cookie store
