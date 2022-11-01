# Docker image for headless building Segger Embedded Studio Projects

# About
The image contains `git`, `wget` and SES of the version defined during build.
The IDE can only be used for headless builds only (e.g. CI).

SES is installed into `/opt/ses/` and `/opt/ses/bin` has been added 
to the `PATH` environment variable.

The image is based on Ubuntu 20.04

Volume `/src` should be used to bind project directory for building.

# Building an image
```
docker build --build-arg VERSION=4.52a -t ses:4.52a .
```

# Building an example project from nRF SDK
```
cd <...>/nRF5_SDK_17.1.0_ddde560
docker run --rm -v "${PWD}:/src" ses:4.52a emBuild -config Release ./examples/ant/ant_plus/ant_hrm/hrm_tx/pca10040/s212/ses/ant_hrm_tx_pca10040_s212.emProject -verbose
```
