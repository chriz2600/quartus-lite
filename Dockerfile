FROM debian:jessie-backports

# basic packages
RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list && \
    echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
    sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/100disablechecks && \
    apt-get update && \
    apt-get -y install git expect emacs24-nox libtcmalloc-minimal4 locales wget

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# adding scripts
ADD files/setup /root/
#ADD files/setup.2 /root/
ADD files/.profile /root/
ADD files/usr/local/bin/quartus_wrapper /usr/local/bin/quartus_wrapper

# install quartus prime
RUN mkdir -p /root/quartus && \
    cd /root/quartus && \
    wget http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_tar/Quartus-lite-18.1.0.625-linux.tar && \
    tar xvf Quartus-lite-18.1.0.625-linux.tar && \
    /root/setup 18.1 && rm -rf /root/quartus && rm -rf /root/setup && \
    rm /opt/intelFPGA_lite/18.1/quartus/linux64/libboost_system.so

ADD files/.profile.addons /root/
