<p>Info:<br>
   This service can be automatically built by the attached Jenkins master docker container.<br>
   I created a Jenkins Master docker image already contains the required plugins.<br>
   This docker image should be build and run as described bellow.<br>
   In order to build the service , use the attached Jenkins job (in .xml).<br>
   The Jenkins master docker socket is connected to the host docker socket, therefore it requires docker daemon running on the host.
</p>
<p>How to build using Jenkins:<br>
   (navigate to the root of the project)<br>
   1.Build and run jenkins master<br>
   &emsp;docker build -t jenkins_master ./jenkins/<br>
   2.Run jenkins master and wait until it fully launch:<br>
   &emsp;docker run -p 8080:8080 -p 50000:50000 -d -v /var/run/docker.sock:/var/run/docker.sock jenkins_master<br>
   3.POST jenkins job:<br>
   &emsp;curl -s -XPOST '<a href="http://127.0.0.1:8080/createItem?name=sre_test-Build">http://127.0.0.1:8080/createItem?name=sre_test-Build</a>' -H "content-type:application/xml" --data "@./jenkins/config.xml"<br>
   4.Navigate to the build job:<br>
   &emsp;<a href="http://127.0.0.1:8080/job/sre_test-Build">http://127.0.0.1:8080/job/sre_test-Build</a><br>
   5.Build the jenkins job.
</p>
<p>How to build and run the service manually:<br>
   (navigate to the root of the project)<br>
   1.Build docker image:<br>
   &emsp;docker build -t sre_test .<br>
   2.Run app:<br>
   &emsp;docker run -d -p 5000:5000 -e FLASK_ENV &lt;env_type&gt; sre_test <br>
   3.Test app:<br>
   &emsp;curl -X POST -H "Content-Type: application/json" -d '{"username": "admin", "password": "admin"}' http://127.0.0.1:5000/auth/login
</p>