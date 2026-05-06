matsuu/nethack
==============

Dockerfile for Nethack 5.0.0

## Usage

### 1. Classic TTY (Default)

```sh
docker run -it matsuu/nethack
```

### 2. Curses Interface

```sh
docker run -it matsuu/nethack --windowtype:curses
```

## Build

```sh
docker build -t matsuu/nethack .
```

## References

- [NetHack Home Page](http://www.nethack.org/)
- GitHub [matsuu/docker-nethack](https://github.com/matsuu/docker-nethack)
- Docker Hub [matsuu/nethack](https://hub.docker.com/r/matsuu/nethack/)
