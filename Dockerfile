FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y coreutils python python3 autopoint bison flex gperf libtool ruby unzip p7zip-full libgdk-pixbuf2.0-dev intltool git vim make automake autoconf libtool-bin gcc-multilib g++-multilib wget && \
    mkdir -p /opt && cd /opt && git clone https://github.com/mxe/mxe mxe && \
    cd /opt/mxe && echo "MXE_TARGETS := x86_64-w64-mingw32.static" >> settings.mk && make -j`nproc` gcc ffmpeg libass jpeg lua libarchive && export PATH=$PWD/usr/bin:$PATH && \
    cd /opt && git clone --depth=1 https://github.com/mpv-player/mpv.git mpv && cd /opt/mpv && python ./bootstrap.py && DEST_OS=win32 TARGET=x86_64-w64-mingw32.static ./waf configure && ./waf -j`nproc` build

WORKDIR /opt/mpv
CMD /bin/bash
