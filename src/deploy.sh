docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db --volume reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post kipspm/post:2.0
docker run -d --network=reddit --network-alias=comment kipspm/comment:2.0
docker run -d --network=reddit -p 9292:9292 kipspm/ui:3.0
