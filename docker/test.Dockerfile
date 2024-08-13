FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
bash \
net-tools
RUN mkdir -p /vol && route >> /vol/route.txt
VOLUME [ "/vol" ]
