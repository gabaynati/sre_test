how to run:
1.run app:
docker run -d -p 5000:5000 -e FLASK_ENV <env_type> sre_test
2.run jenkins master: 
docker run -p 8080:8080 -p 50000:50000 -d jenkins/jenkins:lts
3.test:
curl -X POST -H "Content-Type: application/json" -d '{"username": "admin", "password": "admin"}' http://localhost:5000/auth/login
