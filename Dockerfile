FROM alpine

ARG NH_VER=3.6.7

RUN \
  apk add ncurses && \
  apk add --virtual .build byacc curl flex gcc groff linux-headers make musl-dev ncurses-dev util-linux && \
  ln -s libncurses.so /usr/lib/libtinfo.so && \
  curl -sL https://nethack.org/download/${NH_VER}/nethack-${NH_VER//.}-src.tgz | tar zx && \
  ( \
    cd NetHack-${NH_VER} && \
    sed -i -e 's/cp -n/cp/g' -e '/^PREFIX/s:=.*:=/usr:' sys/unix/hints/linux && \
    sh sys/unix/setup.sh sys/unix/hints/linux && \
    make all && \
    make install \
  ) && \
  rm -rf NetHack-NetHack-${NH_VER}_Released && \
  apk del --purge .build

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
