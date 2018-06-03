FROM alpine

ARG NH_VER=3.6.1

RUN \
  apk --no-cache add bdftopcf byacc curl flex gcc groff libxaw-dev libxt-dev linux-headers make mkfontdir musl-dev util-linux && \
  curl -sL https://nethack.org/download/${NH_VER}/nethack-${NH_VER//.}-src.tgz | tar zxf - && \
  ( \
    cd nethack-${NH_VER} && \
    sed -i -e 's/cp -n/cp/g' -e '/^PREFIX/s:=.*:=/usr:' sys/unix/hints/linux-x11 && \
    sh sys/unix/setup.sh sys/unix/hints/linux-x11 && \
    make all && \
    make install \
  ) && \
  rm -rf nethack-${NH_VER}

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
