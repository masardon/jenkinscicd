# stop docker stack
docker stack rm accelbyte-cicd

# remove preconfigured secret
docker secret rm jenkins-user
docker secret rm jenkins-pass
