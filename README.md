# s6-debian for ARM processors
Incredibly simple edit to the Dockerfile to compile for ARM chips instead

# s6-debian

This is a base Debian image with the [S6 Overlay](https://github.com/just-containers/s6-overlay)

## Usage

See the [S6 Overlay Documentation](https://github.com/just-containers/s6-overlay) for details on how to manage services.

x86_64:

```shell
docker run eddible/s6-debian-rpi
```
