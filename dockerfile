FROM alpine:3.24

# Setup APK Main, Commaunity and Testing repos
RUN echo '' > /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main/ >> /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community/ >> /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories
RUN apk update

# Install OpenJDK 8
RUN apk add openjdk8

# Setup data directory
RUN mkdir /mcsrv

# Get and install the Forge Server Software
RUN cd / && wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.16.5-36.2.20/forge-1.16.5-36.2.20-installer.jar
RUN cd / && java -jar forge-1.16.5-36.2.20-installer.jar --installServer

# Agree to the Minecraft EULA
RUN cd / && touch eula.txt
RUN cd / && echo 'eula=true' > eula.txt

ENTRYPOINT cp -r /mcsrv . && java -jar forge-1.16.5-36.2.20.jar nogui