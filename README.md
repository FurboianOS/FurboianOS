# FurboianOS

A Debian based OS, using pi-gen to build .img's for raspberry pi's and maybe even i386 machines.

## Dependencies

pi-gen runs on Debian-based operating systems. Currently it is only supported on
either Debian Buster or Ubuntu Xenial and is known to have issues building on
earlier releases of these systems. On other Linux distributions it may be possible
to use the Docker build described below.

To install the required dependencies for `pi-gen` you should run:

```bash
apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools libarchive-tools libcap2-bin grep rsync xz-utils file git curl bc \
qemu-utils kpartx gpg pigz
```

## Getting started with building your images

Getting started is as simple as cloning this repository on your build machine. You
can do so with:

```bash
git clone https://github.com/oxmc/FurboianOS.git
```

`--depth 1` can be added afer `git clone` to create a shallow clone, only containing
the latest revision of the repository. Do not do this on your development machine.

Also, be careful to clone the repository to a base path **NOT** containing spaces.
This configuration is not supported by debootstrap and will lead to `pi-gen` not
running.

After cloning the repository, you can move to the next step and start configuring
your build.

## Building

Note:
pi-gen usually takes a config file, but this repo has been hardcoded for a bullseye build, if you wish to build for another distribution, check the branches.

To start building the os you can run either `build.sh` or `build-docker.sh`

Note:

I have only tested `build.sh` as i don't use docker

## Final OS .img

Your images will be loacted at: work/FurboianOS/export_image, and if you do a noobs build aswell, it will be located in the same path, but the folder will be: export_noobs