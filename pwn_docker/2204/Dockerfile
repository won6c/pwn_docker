FROM ubuntu:22.04

ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8
ENV LC_CTYPE C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386
RUN apt-get -y update && apt-get -y upgrade
RUN apt install -y netcat gdb git gcc curl wget vim ruby-full ruby-dev
RUN apt install -y python3 python3-pip python3-dev libssl-dev libffi-dev build-essential
RUN apt install -y net-tools openssh-server
RUN apt-get install libcapstone-dev -y
RUN apt-get install libc6:i386 -y

RUN python3 -m pip install --upgrade pip

RUN pip3 install pwntools ropgadget
RUN gem install one_gadget
RUN gem install seccomp-tools

RUN git clone https://github.com/pwndbg/pwndbg.git
RUN cd pwndbg && ./setup.sh

RUN echo 'source /pwndbg/gdbinit.py' >> /root/.gdbinit

WORKDIR /root

EXPOSE 22
