FROM debian:jessie-backports

# basic packages
RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list && \
    echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
    sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/100disablechecks && \
    apt-get update && apt-get -y install expect locales wget libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# adding scripts
ADD files/ /

# install quartus prime
RUN mkdir -p /root/quartus && \
    cd /root/quartus && \
    wget -q http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_tar/Quartus-lite-20.1.0.711-linux.tar && \
    tar xvf Quartus-lite-20.1.0.711-linux.tar && \
    /root/quartus/components/QuartusLiteSetup-20.1.0.711-linux.run --mode unattended --installdir /opt/intelFPGA_lite/20.1 --disable-components quartus_help,modelsim_ase,modelsim_ae --accept_eula 1 && \
    rm -rf /root/quartus && rm -rf /root/setup*
