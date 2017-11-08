#!/bin/sh

export VAULT_ADDR=http://127.0.0.1:8200

(vault server -config /vault/config/local.json &)
sleep 2

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
  ec=$?
  echo >&2 "TEST FAILED: vault 'init' did not exist with 0"
  exit $ec
fi

killall vault
