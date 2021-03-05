# jenkins-ias

Thanks to 
- https://www.digitalocean.com/community/tutorials/how-to-automate-jenkins-setup-with-docker-and-jenkins-configuration-as-code
- https://dzone.com/articles/securing-password-with-docker-compose-docker-secre
- handling secrets : https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/docs/features/secrets.adoc


more reading : https://fishi.devtail.io/weblog/2019/01/06/jenkins-as-code-part-1/

# decrypt the secrets-encrypted folder

```bash
mkdir -p secrets
cp secrets-encrypted/* secrets/
ansible-vault decrypt secrets/*
```

# build the image

need the associated files in the secrets folder and the private keys

docker build --pull -t jenkins:jcasc .

# run the container

```bash
user=Jenkins
pass=jenkinspasstochange
jenkinsurl=http://jenkinsurltochange
docker run --name jenkins --rm -p 8080:8080 --env JENKINS_ADMIN_ID=${user} --env JENKINS_ADMIN_PASSWORD=${pass} --env JENKINS_URL=${jenkinsurl} jenkins:jcasc 
```

# note for POPS
secrets-encrypted has been encrypted with ansible-vault.

# TODO
- need to create a docker persistent volume and make sure jobs history are kept after restart of the container