FROM alpine

RUN \
  apk --no-cache add byacc curl flex gcc groff linux-headers make musl-dev ncurses-dev util-linux && \
  curl -sL https://sourceforge.net/projects/nethack/files/nethack/3.6.0/nethack-360-src.tgz | tar zxf - && \
  cd nethack-3.6.0 && \
  cd sys/unix && \
  sed -i -e 's/cp -n/cp/g' -e '/^PREFIX/s:=.*:=/usr:' hints/linux && \
  sh setup.sh hints/linux && \
  cd ../.. && \
  make all && \
  make install && \
  cd .. && \
  rm -rf nethack-3.6.0

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
