FROM debian

ENV VERSION v1.2.1
ENV ARCH amd64

ADD https://github.com/CWSpear/local-persist/releases/download/${VERSION}/local-persist-linux-${ARCH} /usr/bin/docker-volume-local-persist
RUN chmod +x /usr/bin/docker-volume-local-persist

RUN mkdir /var/lib/docker

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.3/dumb-init_1.0.3_amd64 /usr/bin/dumb-init
RUN chmod +x /usr/bin/dumb-init

CMD ["dumb-init", "/usr/bin/docker-volume-local-persist"]
