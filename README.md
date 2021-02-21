# jenkins-ias

Thanks to https://www.digitalocean.com/community/tutorials/how-to-automate-jenkins-setup-with-docker-and-jenkins-configuration-as-code

# build the image

docker build -t jenkins:jcasc .

# run the container

```bash
user=Jenkins
pass=jenkinspasstochange
docker run --name jenkins --rm -p 8080:8080 --env JENKINS_ADMIN_ID=${user} --env JENKINS_ADMIN_PASSWORD=${pass} jenkins:jcasc 
```