FROM python:2.7

RUN apt-get install python-fabric

ADD . /fab
WORKON /fab

ENV local=true
RUN fab /fab/fabfile.py

# TODO