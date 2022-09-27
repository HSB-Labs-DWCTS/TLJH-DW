# the-littlest-jupyterhub-dwcts
# Test the-littlest-jupyterhub-dwcts (Bare metal)

`wget` 또는 `curl` 로 설치 합니다.
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/HSB-Labs-DWCTS/the-littlest-jupyterhub-dwcts/main/01.jupyterhub_install.sh | sh
```


### curl
```
sudo curl -L https://raw.githubusercontent.com/HSB-Labs-DWCTS/the-littlest-jupyterhub-dwcts/main/01.jupyterhub_install.sh | sh
```

## the-littlest-jupyterhub-dwcts Login
Login admin
 - admin:admin123
```
http://{Server IP}
```

# Test TLJH-DW (Docker)

## Install Docker

`wget` 또는 `curl` 로 설치 합니다.
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/HSB-Labs-DWCTS/tmp/main/01.docker_install.sh | sh
```

### curl
```
sudo curl -sL https://raw.githubusercontent.com/HSB-Labs-DWCTS/tmp/main/01.docker_install.sh | sh
```

## Add Docker group
```
sudo usermod -a -G docker $USER
sudo usermod -a -G docker $(whoami)
```

## Test the-littlest-jupyterhub-dwcts is with Docker
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

## the-littlest-jupyterhub-dwcts Login
Login admin
 - admin:admin123
```
http://{Server IP}:12000
```
