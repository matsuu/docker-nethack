FROM alpine

ARG NH_VER=3.6.1

RUN \
  apk --no-cache add byacc curl flex gcc groff linux-headers make musl-dev ncurses-dev util-linux && \
  curl -sL https://nethack.org/download/${NH_VER}/nethack-${NH_VER//.}-src.tgz | tar zxf - && \
  ( \
    cd nethack-${NH_VER} && \
    sed -i -e 's/cp -n/cp/g' -e '/^PREFIX/s:=.*:=/usr:' sys/unix/hints/linux && \
    sh sys/unix/setup.sh sys/unix/hints/linux && \
    make all && \
    make install \
  ) && \
  rm -rf nethack-${NH_VER}

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
