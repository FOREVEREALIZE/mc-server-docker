FROM alpine:3.24

# Setup APK Main, Commaunity and Testing repos
RUN echo '' > /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main/ >> /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community/ >> /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories
RUN apk update

# Install OpenJDK 8
RUN apk add openjdk8