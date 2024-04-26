FROM ubuntu:16.04
ENV LC_CTYPE C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386

RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y python-pip python2.7-dev python-setuptools python-capstone libssl-dev libffi-dev build-essential
RUN apt install -y libc6-dbg libcapstone-dev gcc-multilib make gcc netcat git curl wget gdb vim nano zsh
RUN apt install -y net-tools openssh-server

RUN pip install -U pip==20.3.4
RUN pip install --ignore-installed pwntools
RUN pip install ropgadget

RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update -y
RUN apt-get install -y ruby2.6

RUN gem install one_gadget -v 1.7.3

RUN wget https://github.com/pwndbg/pwndbg/archive/refs/tags/2022.01.05.tar.gz
RUN tar xvf 2022.01.05.tar.gz
RUN mv pwndbg-2022.01.05 pwndbg
WORKDIR /pwndbg
RUN sed -i 's/git submodule update --init --recursive/# git submodule update --init --recursive/' setup.sh
RUN sed -i 's|${PYTHON} -m pip install ${INSTALLFLAGS} --upgrade pip|${PYTHON} -m pip install ${INSTALLFLAGS} --upgrade pip==20.3.4|' setup.sh
RUN ./setup.sh
RUN echo "source /pwndbg/gdbinit.py" >> ~/.gdbinit

RUN mkdir /pwn
WORKDIR /pwn
