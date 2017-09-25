#!/bin/sh

export VAULT_ADDR=http://0.0.0.0:8200

(/usr/local/bin/vault server -config /etc/vault/cfg/config.json &)

sleep 3

if vault init
then

  vault status

  if [[ $? == 2 ]]
  then
    exit 0
  else
    echo >&2 "TEST FAILED: vault 'status' did not exist with 0"
  fi
else
    echo >&2 "TEST FAILED: vault 'init' did not exist with 0"
fi

killall vault
