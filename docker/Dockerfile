FROM debian:9.9

LABEL author="jsrfuture" maintainer="jsrfuture@protonmail.com"


RUN DEBIAN_FRONTEND=noninteractive dpkg --add-architecture i386 \ 
&& apt-get update \
&& apt-get upgrade -y \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y bash tar curl g++ gdb expect lsb-release apt-utils \
&& DEBIAN_FRONTEND="noninteractive" apt-get install -y --allow-unauthenticated wget lsb-release apt-utils gnupg debconf debconf-utils mysql-common libatomic1 libc6 libgcc1 libstdc++6 \
&& DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends --allow-unauthenticated expect \
&& wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb \
&& wget http://repo.mysql.com/apt/debian/pool/mysql-5.7/m/mysql-community/libmysqlclient-dev_5.7.27-1debian9_amd64.deb \
&& wget http://repo.mysql.com/apt/debian/pool/mysql-5.7/m/mysql-community/libmysqlclient20_5.7.27-1debian9_amd64.deb \
&& DEBIAN_FRONTEND="noninteractive" echo mysql-apt-config mysql-apt-config/select-server select mysql-5.7 | debconf-set-selections \
&& DEBIAN_FRONTEND="noninteractive" echo mysql-apt-config mysql-apt-config/select-product select Ok | debconf-set-selections \
&& DEBIAN_FRONTEND="noninteractive" dpkg -i mysql-apt-config* \
&& DEBIAN_FRONTEND="noninteractive" dpkg -i libmysqlclient20* \
&& DEBIAN_FRONTEND="noninteractive" apt-get install -y --allow-unauthenticated libmysqlclient20 \
&& DEBIAN_FRONTEND="noninteractive" dpkg -i libmysqlclient-dev* \
&& DEBIAN_FRONTEND="noninteractive" apt-get install -y --allow-unauthenticated git make gcc mysql-server zlib1g-dev libpcre3-dev screen libmysqlclient-dev \
&& useradd -d /home/container -m container -s /bin/bash

#set user properties    
USER container

#set env variables
ENV HOME USER=container HOME=/home/container

#set workdir
WORKDIR /home/container


#Run entrypoint
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh", "mysql"]
