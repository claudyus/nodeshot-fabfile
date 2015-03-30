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

 * During the build, after the ssl certificate generation it stops to write on STDOUT. If you want to keep an eye on the bulding process you can use this workaround `watch docker top <container-id>`
 * Building is slow as hell.
