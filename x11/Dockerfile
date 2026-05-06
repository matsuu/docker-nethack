FROM alpine:3.23

ARG NH_VER=5.0.0

RUN \
  NH_V=$(echo ${NH_VER} | sed -e 's/\.//g') && \
  apk add font-dejavu libxaw libxt motif ncurses qt5-qtmultimedia && \
  apk add --virtual .build bdftopcf byacc curl flex g++ gcc groff libxaw-dev libxt-dev linux-headers make mkfontdir motif-dev musl-dev ncurses-dev qt5-qtmultimedia-dev util-linux && \
  curl -sL https://nethack.org/download/${NH_VER}/nethack-${NH_V}-src.tgz | tar zx && \
  ( \
    cd NetHack-${NH_VER} && \
    sed -i -e 's@^PREFIX=.*@PREFIX=/usr@' sys/unix/hints/linux.${NH_V} && \
    sed -i -e 's/SIG_RET_TYPE=__sighandler_t/SIG_RET_TYPE=sighandler_t/' sys/unix/hints/linux.${NH_V} && \
    sed -i -e '/backtrace/d' src/report.c && \
    sh sys/unix/setup.sh sys/unix/hints/linux.${NH_V} && \
    make fetch-lua && \
    make WANT_WIN_ALL=1 all && \
    make WANT_WIN_ALL=1 install \
  ) && \
  rm -rf NetHack-${NH_VER} && \
  apk del --purge .build

ENV DISPLAY=host.docker.internal:0

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
CMD ["--windowtype:X11"]
#CMD ["--windowtype:Qt"]
