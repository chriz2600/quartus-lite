FROM debian:jessie-backports

# basic packages
RUN apt-get update && \
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
    /root/setup 18.1 && rm -rf /root/quartus && rm -rf /root/setup

ADD files/.profile.addons /root/
