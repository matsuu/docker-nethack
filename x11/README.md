matsuu/nethack-x11
==================

Dockerfile for Nethack 3.6.0 X11

## Howto

    docker run -d matsuu/nethack-x11

### macOS

    brew install socat
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
    docker run -d -e DISPLAY=${MYIP}:0 matsuu/nethack-x11

## Build

    docker build -t matsuu/nethack-x11 .

## References

- [NetHack 3.6.0: Home Page](http://www.nethack.org/)
- [matsuu/docker-nethack](https://github.com/matsuu/docker-nethack)
