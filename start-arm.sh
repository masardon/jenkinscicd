# set permission for local volume
chmod 777 jenkinshome

# set secrets for jenkins
echo "accelbyte" | docker secret create jenkins-user -
echo "accelbyte" | docker secret create jenkins-pass -

# run docker stack
docker stack deploy --compose-file docker-compose-arm.yml accelbyte-cicd
