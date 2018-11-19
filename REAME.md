Info:
This service can be automatically built by the attached Jenkins master docker container.
I created a Jenkins Master docker image already contains the required plugins.
This docker image should be build and run as described bellow.
In order to build the service , use the attached Jenkins job (in .xml).
The Jenkins master docker socket is connected to the host docker socket, therefore it requires docker daemon running on the host.




How to build using Jenkins:
1.Build and run jenkins master
    docker build -t jenkins_master ./jenkins/
2.Run jenkins master and wait until it fully launch:
    docker run -p 8080:8080 -p 50000:50000 -d -v /var/run/docker.sock:/var/run/docker.sock jenkins_master
3.POST jenkins job:
    curl -s -XPOST 'http://127.0.0.1:8080/createItem?name=sre_test-Build' -H "content-type:application/xml" --data "@./jenkins/config.xml"
4.Navigate to the build job:
    http://127.0.0.1:8080/job/sre_test-Build
5.Build the jenkins job.




How to build and run the service manually:
1.Build docker image:
    docker build -t sre_test .
2.Run app:
    docker run -d -p 5000:5000 -e FLASK_ENV <env_type> sre_test
