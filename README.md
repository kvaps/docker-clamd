Clamd in a Docker
=================

Quick start
-----------

**run command**

```bash
docker run \
    --name clamd \
    -h clamd \
    -v /opt/clamd:/data:rw \
    -p 3310:3310 \
    -d \
    kvaps/clamd
```

Docker-compose
--------------

**docker-compose.yml**

```yaml
clamd:
  restart: always
  image: kvaps/clamd
  hostname: clamd
  volumes:
    - /etc/localtime:/etc/localtime:ro
    - ./clamd:/data
```
