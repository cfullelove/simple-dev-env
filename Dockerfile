FROM ubuntu:14.04

RUN apt-get update && \
        apt-get install -y --no-install-recommends \
                vim \
		git \
		wget \
		screen \
        && apt-get clean

ADD gotty /bin/

VOLUME /root
VOLUME /app

ENTRYPOINT /bin/gotty -w --timeout "0" -p 8080 -a 0.0.0.0 --reconnect /bin/bash -c "screen -x || screen"

