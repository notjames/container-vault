[![pipeline status](https://git.cnct.io/common-tools/samsung-cnct_container-vault/badges/master/pipeline.svg)](https://git.cnct.io/common-tools/samsung-cnct_container-vault/commits/master)

The purpose of this repo is to maintain the Docker container assets for the Hashicorp Vault application for [Kraken](https://github.com/samsung-cnct/kraken) Cluster-ops et al for Samsung-CNCT projects.

This project is covered by gitlab CICD via failfast and, upon successful testing, built and submitted to Quay.

## Caveats

  Currently, this container builds a command called `jo`, which is currently required because Alpine Linux's `apk` does
  not have a version of `jo` in its repository, but is currently used (temporarily) by the Vault start script which is
  used in the [Vault chart](http://github.com/samsung-cnct/chart-vault), which is currently in heavy development.

## Build

One can test the container by running the following:

    docker run -it -e ENVIRONMENT=test vault:<version>
