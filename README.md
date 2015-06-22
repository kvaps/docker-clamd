Clamd in a Docker container
===============================

Run
---

```bash
docker run \
    --name clamd \
    -h clamd \
    -v /data/clamd:/data:rw \
    -p 3310:3310 \
    -d \
    kvaps/clamd
```
