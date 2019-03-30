FROM python:3.7-slim

ENV RQ_VERSION 0.10.0

RUN apt-get update && apt-get install -y  \
      gcc \
      libc-dev 

RUN pip3 install rq==$RQ_VERSION

WORKDIR /app

ADD . /app/

RUN pip3 install -r /app/requirements.txt && \
    python3 setup.py develop

EXPOSE 3123

ENTRYPOINT ["rq-dashboard"]
