[![Build Status](https://common-jenkins.kubeme.io/buildStatus/icon?job=container-vault/master)](https://common-jenkins.kubeme.io/job/container-vault/master)

This project was copied from an older, lesser-used repo [samsung-cnct/vault](https://github.com/samsung-cnct/vault). This project was started using the [solas-container](https://github.com/samsung-cnct/solas-container) repo.

The purpose of this repo is to maintain the Docker container assets for the Hashicorp Vault application for [Kraken](https://github.com/samsung-cnct/kraken) Cluster-ops et al for Samsung-CNCT projects.

This project will automaticaly get checked by Jenkins and then, upon successful testing, built and submitted to Quay.


## Set up your environment for dependencies
This will likely change in the future, but for now this is what we got.

If you have dependencies that need to be injected into the Vault container, create a directory under
`build` reflecting your required dependency IE

    mkdir -p build/<depname>

Make sure you have a `pkg` directory in your directory tree that is linked to the container `pkgs` directory:


    ln -s $PWD/pkgs $PWD/build/<depname>/pkg

Create a script, makefile, rakefile, etc that builds/compiles your dependency. Copy or mv what you need from your dep tree
to the `pkg` directory in your dep directory. The Vault container will automatically suck it into `/usr/local/bin/` in the container.
If that's not the desired result then you'll need to season the Vault Dockerfile to taste.

## Build

One can test the container by running the following:

    docker run -it -e ENVIRONMENT=test vault:<version>
