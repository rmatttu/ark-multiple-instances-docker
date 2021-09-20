FROM ubuntu:20.04
LABEL maintainer="mggggk<mggggk@gmail.com>"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

ENV USER_ID 1000
ENV GROUP_ID 1000

RUN set -x \
    && : "Add user steam" \
    && adduser --disabled-login --shell /bin/bash --gecos "" steam \
    && usermod -a -G sudo steam

RUN set -x \
    && : "Install requirement" \
    && apt -y update \
    && apt -y install perl-modules curl lsof libc6-i386 lib32gcc1 bzip2

RUN set -x \
    && : "Install optional" \
    && apt -y install less

RUN set -x \
    && : "Install arkmanager" \
    && cd /home/steam/ \
    && curl -sL https://git.io/arkmanager | bash -s steam

RUN set -x \
    && : "Append bashrc" \
    && touch /root/.bashrc \
    && { \
        echo '# switch user "steam"'; \
        echo 'su steam'; \
        echo 'cd ~/'; \
    } >> /root/.bashrc


EXPOSE 7777 7777/udp 7778 7778/udp 27015 27015/udp 32330
EXPOSE 7779 7779/udp 7780 7780/udp 27016 27016/udp 32331

COPY user.sh /app/
COPY run.sh /app/

ENTRYPOINT ["/app/user.sh"]
