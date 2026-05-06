matsuu/nethack-x11
==================

Dockerfile for Nethack 5.0.0 X11

## Usage

### X11 (Default)

```sh
docker run -d matsuu/nethack-x11
```

### Qt Interface

```sh
docker run -d matsuu/nethack-x11 --windowtype:Qt
```

## Build

```sh
docker build -t matsuu/nethack-x11 .
```

## References

- [NetHack Home Page](http://www.nethack.org/)
- [matsuu/docker-nethack](https://github.com/matsuu/docker-nethack)
- [How to run dockerized X Windows apps on macOS](http://mamykin.com/posts/running-x-apps-on-mac-with-docker/)
