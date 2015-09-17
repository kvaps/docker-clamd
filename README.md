Clamd in a Docker container
===============================

Run
---

```bash
docker run \
    --name clamd \
    -h clamd \
    -v /opt/clamd:/data:rw \
    --env TZ=Europe/Moscow \
    -p 3310:3310 \
    -d \
    kvaps/clamd
```

Systemd unit
------------

Example of systemd unit: `/etc/systemd/system/clamd.service`

```bash
[Unit]
Description=ClamAV Server
After=docker.service
Requires=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker run --name clamd -h clamd -v /opt/clamd:/data --env TZ=Europe/Moscow kvaps/clamd
ExecStop=/usr/bin/docker stop -t 5 clamd ; /usr/bin/docker rm -f clamd

[Install]
WantedBy=multi-user.target
```
