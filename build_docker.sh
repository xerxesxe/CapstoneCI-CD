#go to directory
cd node-bulletin-board/bulletin-board-app/

#build docker 
docker build --tag bulletinboard:1.0 .

#docker run
docker run --publish 8000:8080 --detach --name bb bulletinboard:1.0