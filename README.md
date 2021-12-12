# ktvGIT_microservices
ktvGIT microservices repository


## docker-2

Установлен докер
Собран образ
Создан и запущен контейнер на удаленном хосте
Образ сохранен в DockerHub.
Объясните чем отличается контейнер от образа добавлено в dockermonolith/docker-1.log

Реализовано Поднятие инстансов с помощью Terraform
Создано несколько плейбуков Ansible с использованием динамического инвентори для установки докера и запуска там образа приложения

Создан шаблон пакера, который делает образ с уже установленным Docker

## docker-3

Собраны  Docker-образы для сервисного приложения
Оптимизирована  работа с Docker-образами (*)
Изучен запуск с различными прраметрами -v  -е --env  (*) run_all.sh
Запуск и работа приложения на основе Docker-образов, оценка удобства запуска контейнеров при помощи

Правильный requirements.txt
prometheus_client==0.0.21
# flask==0.12.3
pymongo==3.5.1
structlog==17.2.0
# py-zipkin==0.13.0 Отключить в версии Dockerfile
py-zipkin==0.13.0
requests==2.18.4


## docker-4
Работа с сетями в Docker
Использование docker-compose
Разобраться с работой сети в Docker none host bridge


yc-user@docker-host:~$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
yc-user@docker-host:~$ sudo ip netns
Error: Peer netns reference is invalid.
Error: Peer netns reference is invalid.
d275e5085838
default
yc-user@docker-host:~$ sudo ip netns exec default sudo docker run --network none -d nginx
9a9f3f44e9f621861b4f9315b018cf94479814aa6b966b5a1d2489dd7c55bd6d
yc-user@docker-host:~$ sudo ip netns
c61209334579
default
yc-user@docker-host:~$ sudo ip netns exec default sudo docker run --network host -d nginx
e67a8e3b90519f7d50fae49c77094877ab82554edbe9f38b2756976457378fe0
yc-user@docker-host:~$ sudo ip netns
c61209334579
default
yc-user@docker-host:~$

docker network ls
NETWORK ID     NAME        DRIVER    SCOPE
5f8bbd0dcb15   back_net    bridge    local
2bc2c60a2d19   bridge      bridge    local
c2e05d86ad4a   front_net   bridge    local
acaeee20a7a9   host        host      local
d7cd12a79c48   none        null      local
f3e608fd624b   reddit      bridge    local

yc-user@docker-host:~$ ifconfig | grep br
br-5f8bbd0dcb15: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.1  netmask 255.255.255.0  broadcast 10.0.2.255
br-c2e05d86ad4a: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.1.1  netmask 255.255.255.0  broadcast 10.0.1.255
br-f3e608fd624b: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.18.0.1  netmask 255.255.0.0  broadcast 172.18.255.255
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        inet 10.128.0.16  netmask 255.255.255.0  broadcast 10.128.0.255


Установить docker-compose на локальную машину
Собрать образы приложения reddit с помощью docker-compose
Запустить приложение reddit с помощью dockercompose

берется из имени рабочнго каталога
docker-compose up -d -p <NAME Specify>

## gitlab-ci-1

Подготовить инсталляцию Gitlab CI
Подготовить репозиторий с кодом приложения
Описать для приложения этапы пайплайна
Определить окружения
* Ansible-плейбук (или небольшую роль) по поднятию GitLab в контейнере.
* Запуск reddit в контейнере (по желанию)
* Автоматизация развёртывания GitLab Runner (по желанию)
* Настройка оповещений в Slack (по желанию)

 в Project, который мы создали, в Settings -> Integrations -> Slack notifications добавляем Webhook
 из предварительно добавленного в нужный канал Slack приложения Incoming WebHooks

http://51.250.11.17/help/user/project/integrations/slack
Slack notifications service (FREE)
The Slack notifications service enables your GitLab project to send events

https://docs.gitlab.com/ee/ci/docker/using_docker_build.html
Use Docker to build Docker images

https://hub.docker.com/_/docker/
docker Official Image

## monitoring-1

Prometheus: запуск, конфигурация, знакомство с Web UI
Мониторинг состояния микросервисов
Сбор метрик хоста с использованием экспортера

https://hub.docker.com/u/ktv2020


### logging-1
Подготовка окружения
Логирование Docker-контейнеров
Сбор неструктурированных логов
Визуализация логов
Сбор структурированных логов
Распределенный трейсинг
* Разбор ещё одного формата логов (по желанию)
Траблшутинг UI-экспириенса (по желанию)
