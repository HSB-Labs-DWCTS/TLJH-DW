# tmp
## Test TLJH-DW

## Install Docker (wget)
```
sudo wget -qO- https://raw.githubusercontent.com/HSB-Labs-DWCTS/tmp/main/01.docker_install.sh | sh
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
