# bfoote/ptp-build-docker

Docker image for building a lede environment
[https://github.com/bnfinet/lede-docker]

the longer term goal is to provide a dockerized build of [https://personaltelco.net/wiki](PersonalTelco) images

The image is built via a docker-hub automated build.

the build instructions are derived from a combination of
* https://personaltelco.net/wiki/FooCabFirmwareHowTo
* https://lede-project.org/docs/guide-developer/use-buildsystem

## howto build lede images with this repo

* `./run_docker.sh`
  runs a bash shell inside of a `bfoote/lede` docker container
  several directories and files are mounted from `./volumes`
* `make menuconfig`
* configure for your device to your hearts content :)
  the config is saved to your local disk at `./volumes/.config`
* `make -j9`
  build the images



## troubleshooting
* set permissions on `./volumes`
  `sudo chmod -R 775./volumes`
  `sudo chown -R ${USER}:${USER} ./volumes`
