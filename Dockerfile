FROM ubuntu:22.04

RUN apt update && apt install -y python3 wget

WORKDIR /app

COPY ./*.py ./entrypoint.sh .

RUN wget -O- splunkforwarder-9.4.1-e3bdab203ac8-linux-amd64.tgz "https://download.splunk.com/products/universalforwarder/releases/9.4.1/linux/splunkforwarder-9.4.1-e3bdab203ac8-linux-amd64.tgz" | tar -zxvf- -C /app

ENTRYPOINT /app/entrypoint.sh
