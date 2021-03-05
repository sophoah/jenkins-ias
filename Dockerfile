FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY secrets/sec_* /run/secrets/
RUN mkdir -p /var/jenkins_home/.ssh
COPY --chown=jenkins:jenkins secrets/known_hosts /var/jenkins_home/.ssh/known_hosts
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml