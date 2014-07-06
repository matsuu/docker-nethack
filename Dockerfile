FROM centos

RUN yum install -y bison bzip2 col flex gcc glibc-headers groff make ncurses-devel patch tar wget yacc

RUN wget http://sourceforge.net/projects/nethack/files/nethack/3.4.3/nethack-343-src.tgz

RUN tar zxf nethack-343-src.tgz && \
  cd nethack-3.4.3 && \
  sh sys/unix/setup.sh x && \
  sed -i \
    -e "/^CFLAGS/s/-O/-O2 -fomit-frame-pointer/" \
    -e "/^WINTTYLIB/s/=.*/= -lncurses/" \
    sys/unix/Makefile.src && \
  sed -i \
    -e "/^CFLAGS/s/-O/-O2 -fomit-frame-pointer/" \
    -e "/^YACC /s/=.*/= bison -y/" \
    sys/unix/Makefile.utl && \
  sed -i \
    -e "s:/\* \(#define LINUX\) \*/:\1:" \
    include/unixconf.h && \
  make all && \
  make install && \
  cd .. && \
  rm nethack-343-src.tgz && \
  rm -rf nethack-3.4.3

# for backup
VOLUME /usr/games/lib/nethackdir

CMD ["/usr/games/nethack"]
