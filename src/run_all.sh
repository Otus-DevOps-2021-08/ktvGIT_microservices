docker kill $(docker ps -q)



# docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
#  with volume
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
# docker run -d --network=reddit --network-alias=post ktv2020/post:1.6
docker run -d --network=reddit --network-alias=comment ktv2020/comment:1.0
docker run -d --network=reddit -p 9292:9292 ktv2020/ui:2.0

# with env example
docker run  -d  \
-e POST_DATABASE_HOST='post_db' \
-e POST_DATABASE='posts' \
--network=reddit  --network-alias=post ktv2020/post:1.6
