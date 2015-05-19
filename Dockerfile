FROM ubuntu:latest
MAINTAINER encrypt <encrypt@labr.xyz>

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y ssh fabric && \
    echo "UsePAM no" > /etc/ssh/sshd_config && \
    mkdir /var/run/sshd && \
    chmod 0755 /var/run/sshd

ADD . /fabric

RUN echo "root:password" | chpasswd && \
    /usr/sbin/sshd && \
    cd /fabric && \
    fab install:use_defaults=True -H 127.0.0.1 -u root -p password

EXPOSE 80 443

ENTRYPOINT service nginx start && \
	   service postgresql start && \
	   service redis-server start && \
	   service supervisor start && \
           /bin/bash -c "source /usr/local/bin/virtualenvwrapper.sh && workon nodeshot && ./var/www/nodeshot/manage.py runserver"