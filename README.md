# TLJH-DW
# Test TLJH-DW (Bare metal)
### wget
```
sudo wget -qO- https://raw.githubusercontent.com/HSB-Labs-DWCTS/TLJH-DW/main/01.jupyterhub_install.sh | sh
```

### curl
```
sudo curl -sL https://raw.githubusercontent.com/HSB-Labs-DWCTS/TLJH-DW/main/01.jupyterhub_install.sh | sh
```

# Test TLJH-DW (Docker)

## Install Docker
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

## Test TLJH-dw is with Docker
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

## TLJH-DW Login
Login admin
 - admin:admin123
```
http://{Server IP}:12000
```
