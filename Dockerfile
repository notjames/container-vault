FROM alpine:3.2
MAINTAINER Jim Conner <snafu.x@gmail.com>

ENV VAULT_VERSION    0.8.3

COPY config.json /etc/vault/cfg/config.json

RUN apk --update add openssl zip \
&& wget http://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
&& unzip vault_${VAULT_VERSION}_linux_amd64.zip \
&& mv vault /usr/local/bin/ \
&& rm -f vault_${VAULT_VERSION}_linux_amd64.zip

ENTRYPOINT ["/usr/local/bin/vault"]
CMD ["server", "-config", "/etc/vault/cfg/config.json"]
