#!/bin/bash

export VAULT_ADDR=0.0.0.0:80

if vault init
then
  if vault status
  then
    exit 0
  else
    echo >&2 "TEST FAILED: vault 'status' did not exist with 0"
  fi
else
    echo >&2 "TEST FAILED: vault 'init' did not exist with 0"
fi
