# the-littlest-jupyterhub-dwcts

# Bare metal

## Prerequisites
### install build tools
```
sudo apt-get install -y build-essential
```
### Node.js
```
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

## Installation
`wget` 또는 `curl` 로 설치 합니다.
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/hsb-labs-dwcts/the-littlest-jupyterhub-dwcts/main/baremetal/jupyterhub_install.sh | sh
```


### curl
```
sudo curl -L https://raw.githubusercontent.com/hsb-labs-dwcts/the-littlest-jupyterhub-dwcts/main/baremetal/jupyterhub_install.sh | sh
```

## Login
Login admin
 - admin:password
```
http://{Server IP}
```

# Docker

## Install Docker

`wget` 또는 `curl` 로 설치 합니다.
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/hsb-labs-dwcts/the-littlest-jupyterhub-dwcts/main/01.docker_install.sh | sh
```

### curl
```
sudo curl -sL https://raw.githubusercontent.com/hsb-labs-dwcts/the-littlest-jupyterhub-dwcts/main/01.docker_install.sh | sh
```

## Add Docker group
```
sudo usermod -a -G docker $USER
sudo usermod -a -G docker $(whoami)
```

## Test tljh-dwcts is with Docker
```
docker run \
  --privileged \
  --detach \
  --name=tljh-dw \
  --publish 12000:80 \
  --mount type=bind,source=$(pwd),target=/srv/src \
  hsblabs/tljh-dw
```

## Shell inside the running docker container
```
docker exec -it tljh-dw /bin/bash
```

## Login
Login admin
 - admin:password
```
http://{Server IP}:12000
```
