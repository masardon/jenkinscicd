FROM jenkins/jenkins:latest

# copy preconf-plugins and install jenkins plugins
COPY --chown=jenkins:jenkins preconf-plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

# skiping initial wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# run init groovy script to set preeconf-user
COPY preconf-user.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# installing filebeat
USER root
RUN curl -o /tmp/filebeat.deb https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.14.2-amd64.deb && dpkg -i /tmp/filebeat.deb && apt-get install

# filebeat pre-configured
COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml

# filebeat start
COPY ["entrypoint.sh", "/"]
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]

# volume for Jenkins settings
VOLUME /var/jenkins_home
