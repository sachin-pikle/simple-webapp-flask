FROM ubuntu:18.04

RUN apt-get update \
    && apt-get upgrade -y \
#    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    && apt-get install -y \
    python \
#    python-setuptools \
#    python-dev \
#    build-essential \
    python-pip \
#    python-mysqldb \
    && rm -rf /var/lib/apt/lists/*

RUN pip install flask
# RUN pip install flask-mysql

COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0

