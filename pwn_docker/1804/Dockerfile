FROM ubuntu:18.04
ENV LC_CTYPE C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386

RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y python3 python3-pip python3-dev python3-setuptools python-capstone libssl-dev libffi-dev build-essential
RUN apt install -y libc6-dbg gcc-multilib make gcc netcat git curl wget gdb vim nano zsh ruby-full
RUN apt install -y net-tools openssh-server

RUN python3 -m pip install --upgrade pip
RUN pip3 install pwntools ropgadget
RUN gem install one_gadget
RUN gem install seccomp-tools -v 1.5.0

RUN wget https://github.com/pwndbg/pwndbg/archive/refs/tags/2023.03.19.tar.gz
RUN tar xvf 2023.03.19.tar.gz
RUN mv pwndbg-2023.03.19 pwndbg
WORKDIR /pwndbg
RUN sed -i 's/git submodule update --init --recursive/# git submodule update --init --recursive/' setup.sh
RUN ./setup.sh
RUN echo "source /pwndbg/gdbinit.py" >> ~/.gdbinit

WORKDIR /root
RUN apt install -y dh-autoreconf
RUN git clone https://github.com/NixOS/patchelf
WORKDIR /root/patchelf
RUN git checkout 0.17.2
RUN ./bootstrap.sh
RUN ./configure
RUN make
RUN make check
RUN make install

RUN mkdir /pwn
WORKDIR /pwn
