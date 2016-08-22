FROM alpine

RUN \
  apk --no-cache add bdftopcf byacc curl flex gcc groff libxaw-dev libxt-dev linux-headers make mkfontdir musl-dev util-linux && \
  curl -sL https://sourceforge.net/projects/nethack/files/nethack/3.6.0/nethack-360-src.tgz | tar zxf - && \
  ( \
    cd nethack-3.6.0 && \
    sed -i -e 's/cp -n/cp/g' -e '/^PREFIX/s:=.*:=/usr:' sys/unix/hints/linux-x11 && \
    sh sys/unix/setup.sh sys/unix/hints/linux-x11 && \
    make all && \
    make install \
  ) && \
  rm -rf nethack-3.6.0

# for backup
VOLUME /usr/games/lib/nethackdir

ENTRYPOINT ["/usr/games/nethack"]
