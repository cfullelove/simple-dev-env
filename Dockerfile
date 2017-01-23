FROM ubuntu:14.04

RUN apt-get update && \
        apt-get install -y --no-install-recommends \
                vim \
		git \
		wget \
		screen \
		openssh-client \
        && apt-get clean

RUN mkdir -p ~/.ssh && echo "IdentityFile ~/ssh_key" > ~/.ssh/config

ADD gotty /bin/

EXPOSE 8080

VOLUME /app
VOLUME /.ssh

ENTRYPOINT /bin/gotty -w -p 8080 -a 0.0.0.0 --reconnect /bin/bash -c "screen -x || screen bash -l"
