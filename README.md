# Overview
This repo contains a Dockerfile for building mpv for Windows. To build, just:

```bash
sudo docker build -t mpv .
```

Then copy out the built `mpv.exe` file:

```bash
sudo docker run -dit --name mpv mpv
sudo docker cp mpv:/opt/mpv/build/mpv.exe .
sudo docker kill mpv
sudo docker rm mpv
```
# Pre-built mpv
I've posted a pre-build mpv for Windows as a release for this project.
