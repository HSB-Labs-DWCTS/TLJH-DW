# tmp

test TLJH-dw is with Docker
```
docker run \
  --privileged \
  --detach \
  --name=tljh-dw \
  --publish 12000:80 \
  --mount type=bind,source=$(pwd),target=/srv/src \
  hsblabs/tljh-dw
```
