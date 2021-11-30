# install runner
# docker run -d --name gitlab-runner --restart always -v /srv/gitlabrunner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest

docker exec -it gitlab-runner gitlab-runner register \
 --url http://<your-ip>/ \
 --non-interactive \
 --locked=false \
 --name DockerRunner \
 --executor docker \
 --docker-image alpine:latest \
 --registration-token <your-token> \
 --tag-list "linux,xenial,ubuntu,docker" \
 --run-untagged


#################################
RUNNER_NAME=${2:-gitlab-runner2}

# запускаем runner:
docker run -d --name $RUNNER_NAME --restart always \
  -v /srv/${RUNNER_NAME}/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest

# регистрируем запущенный runner:
docker exec -it $RUNNER_NAME gitlab-runner register \
  --run-untagged \
  --locked=false \
  --non-interactive \
#    --url ${GITLAB_CI_URL:-http://127.0.0.1} \
#   --registration-token $GITLAB_CI_TOKEN \
  --url http://51.250.11.17/ \
  --registration-token sVmRQDKmegd_V2EP8CX4 \
  --description "docker-runner" \
  --tag-list "linux,xenial,ubuntu,docker" \
  --executor docker \
  --docker-image "alpine:latest" \
  --docker-privileged \
# для корректной работы Docker-in-Docker:
  --docker-volumes "docker-certs-client:/certs/client" \
  --env "DOCKER_DRIVER=overlay2" \
  --env "DOCKER_TLS_CERTDIR=/certs"


на управляющей
cd $DOCKER_CERT_PATH
ca.pem, cert.pem, key.pem
Project, который мы создали, в Settings -> CI / CD -> Variables добавляем переменные типа File
# DOCKER_HOST_CA_FILE, DOCKER_HOST_CERT_FILE, DOCKER_HOST_KEY_FILE
