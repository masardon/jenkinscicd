# Dockerizing Custom Jenkins Image, Elasticsearch and Kibana

Create Jenkins Image that skip Initial Jenkins Wizard and give preconfigured admin user and password, 
and installing Filebeat to stream logs to Elastic Search so can be displayed in Kibana.

### Example Docker Stack Deploy (Swarm Orchestration)
Here is the example that run on my Arm Based (Amphere CPU) Cloud Infrastructure :

_Jenkins Server_

Host : http://140.238.204.245:8001
User : teaserclown
Pass : teaserclown

_Elasticsearch Host_

Host : http://140.238.204.245:9200

_Kibana Host_

Host : http://140.238.204.245:5601
