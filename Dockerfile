FROM ubuntu:18.04

RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip \
            texinfo gcc-multilib build-essential chrpath socat cpio python \
            python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping \
            python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm locales \
            vim bash-completion screen

ARG USERNAME=dev

ARG PUID=1000

ARG PGID=1000

ENV YOCTO_ENTRYPOINT ${YOCTO_ENTRYPOINT:-/yocto-entrypoint.sh}

RUN groupadd -g ${PGID} ${USERNAME} \
            && useradd -u ${PUID} -g ${USERNAME} -d /home/${USERNAME} ${USERNAME} \
            && mkdir /home/${USERNAME} \
            && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

#COPY /home/amit/./bashrc /home/${USERNAME}/.bashrc

USER ${USERNAME}

WORKDIR /home/${USERNAME}

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

