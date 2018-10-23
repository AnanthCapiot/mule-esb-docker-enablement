1) Create Dockerfile
2) Ensure you have Mule ESB EE installer zip
3) Run the following command to create docker image of Mule ESB
docker image build -t mule-ee:3.9.1 .
4) Run the following to start Mule ESB as a docker container
docker run <<container_id>>

Misc:
List images:
docker images ls
docker container ls