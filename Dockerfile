FROM alpine:3.23

ARG NH_VER=5.0.0

RUN \
  NH_V=$(echo ${NH_VER} | sed -e 's/\.//g') && \
  apk add ncurses && \
  apk add --virtual .build byacc curl flex gcc groff linux-headers make musl-dev ncurses-dev util-linux && \
  curl -sL https://nethack.org/download/${NH_VER}/nethack-${NH_V}-src.tgz | tar zx && \
  ( \
    cd NetHack-${NH_VER} && \
    sed -i -e 's@^PREFIX=.*@PREFIX=/usr@' sys/unix/hints/linux.${NH_V} && \
    sed -i -e 's/SIG_RET_TYPE=__sighandler_t/SIG_RET_TYPE=sighandler_t/' sys/unix/hints/linux.${NH_V} && \
    sed -i -e '/backtrace/d' src/report.c && \
    sh sys/unix/setup.sh sys/unix/hints/linux.${NH_V} && \
    make fetch-lua && \
    make WANT_WIN_TTY=1 WANT_WIN_CURSES=1 all && \
    make WANT_WIN_TTY=1 WANT_WIN_CURSES=1 install \
  ) && \
  rm -rf NetHack-${NH_VER} && \
  apk del --purge .build

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
CMD ["--windowtype:tty"]
#CMD ["--windowtype:curses"]
