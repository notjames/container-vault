FROM alpine:3.2
MAINTAINER Jim Conner <snafu.x@gmail.com>

ENV VAULT_VERSION    0.8.3
ENV ENVIRONMENT      prod

COPY config.json /etc/vault/cfg/config.json
COPY test/vault.sh /var/tmp/vault.sh
COPY bin/run_vault.sh /usr/local/bin/run_vault.sh

RUN apk --update add openssl zip && \
    wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
    mv vault /usr/local/bin/ && \
    rm -f vault_${VAULT_VERSION}_linux_amd64.zip

#ENTRYPOINT ["/usr/local/bin/vault"]
#CMD ["server", "--config", "/etc/vault/cfg/config.json"]

ENTRYPOINT "/usr/local/bin/run_vault.sh"
