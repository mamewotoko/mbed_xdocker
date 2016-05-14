FROM 32bit/ubuntu:14.04
MAINTAINER Takashi Masuyama <mamewotoko@gmail.com>

RUN sudo apt-get update && sudo apt-get install make git python python-colorama python-jinja2 wget -y
RUN mkdir /work /work/build 
WORKDIR /opt
RUN git clone https://github.com/mbedmicro/mbed.git
RUN wget "https://launchpad.net/gcc-arm-embedded/4.7/4.7-2012-q4-major/+download/gcc-arm-none-eabi-4_7-2012q4-20121208-linux.tar.bz2"
RUN tar xfj gcc-arm-none-eabi-4_7-2012q4-20121208-linux.tar.bz2
ENV TOOLCHAIN_PATH=/opt/gcc-arm-none-eabi-4_7-2012q4
ENV PATH=${TOOLCHAIN_PATH}/bin:${PATH}
WORKDIR /opt/mbed
#TODO: config
RUN python workspace_tools/build.py -m LPC1768 -t GCC_ARM -r -e -u -d

WORKDIR /mbxc
ENTRYPOINT ["/mbxc/entrypoint.sh"]
COPY imagefiles/entrypoint.sh imagefiles/mbxc imagefiles/Makefile.config /mbxc/

VOLUME /build
WORKDIR /build

