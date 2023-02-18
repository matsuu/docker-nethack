FROM alpine

ARG NH_VER=3.6.7

RUN \
  apk add ncurses libxaw libxt && \
  apk add --virtual .build bdftopcf byacc curl flex gcc groff libxaw-dev libxt-dev linux-headers make mkfontdir musl-dev ncurses-dev util-linux && \
  ln -s libncurses.so /usr/lib/libtinfo.so && \
  curl -sL https://nethack.org/download/${NH_VER}/nethack-${NH_VER//.}-src.tgz | tar zxf - && \
  ( \
    cd NetHack-${NH_VER} && \
    sed -i -e 's/cp -n/cp/g' -e '/^PREFIX/s:=.*:=/usr:' sys/unix/hints/linux-x11 && \
    sh sys/unix/setup.sh sys/unix/hints/linux-x11 && \
    make all && \
    make install \
  ) && \
  rm -rf NetHack-NetHack-${NH_VER}_Released && \
  apk del --purge .build

ENV DISPLAY=host.docker.internal:0

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
