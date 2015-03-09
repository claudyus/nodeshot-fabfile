nodeshot-docker
================

An attempt to run [nodeshot](https://github.com/ninuxorg/nodeshot) in a container.

Usage
-----

```sh
docker build -t nodeshot:latest .
docker run -d -p 443:443 -p 80:80 nodeshot
```
Visit https://127.0.0.1/

Know Issues
-----------

Building is slow as hell.
