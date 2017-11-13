FROM alpine:3.6
LABEL purpose      "jo package builder"
LABEL maintainer   "Jim Conner <snafu.x@gmail.com>"

ENV JO_VER         "1.1"
ENV JO_TARBALL     "jo-$JO_VER.tar.gz"
ENV JO_URL         "https://github.com/jpmens/jo/releases/download/v$JO_VER/$JO_TARBALL"
ENV TMPDIR         "/var/tmp"
ENV BUILD_DIR      "$TMPDIR/build"

RUN apk add --no-cache alpine-sdk build-base && \
    mkdir -p $BUILD_DIR && chmod 777 $BUILD_DIR && \
    curl -L -s $JO_URL | sudo -u nobody tar -C $BUILD_DIR -xz && \
    mv $BUILD_DIR/jo* $BUILD_DIR/jo

USER nobody

WORKDIR $BUILD_DIR/jo

RUN ./configure --prefix /usr && make all

USER root
VOLUME /pkg

#RUN ls -ltr
CMD cp jo /pkg

