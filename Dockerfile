#FROM ubuntu:18.04
FROM nvidia/cuda:11.1-base-ubuntu18.04

LABEL trex <bnb>

WORKDIR /root

RUN apt update
RUN apt -y install wget 
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.19.11/t-rex-0.19.11-linux-cuda11.1.tar.gz

RUN tar -xzf t-rex-0.19.11-linux-cuda11.1.tar.gz

ENV ETH_ADDRESS=bnb1dfldwqphw5h425j0vy67yn23fe8qz5prwxu7vx
ENV SERVER=etchash.unmineable.com:3333
ENV WORKER_NAME=docker-worker

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
