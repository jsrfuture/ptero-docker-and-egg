FROM debian:9.9

LABEL author="jsrfuture" maintainer="jsrfuture@protonmail.com"


RUN DEBIAN_FRONTEND=noninteractive dpkg --add-architecture i386 \ 
&& apt-get update \
&& apt-get upgrade -y \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y git make screen bash tar curl gcc g++ gdb debconf debconf-utils expect \
&& useradd -m -d /home/container container

#set user properties    
USER container

#set env variables
ENV HOME USER=container HOME=/home/container

#set workdir
WORKDIR /home/container


#Run entrypoint
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
