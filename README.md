# build-radio-stuff

## How to install

This assumes you are on reasonably recent distribution of Linux.

Start by installing needed dependencies using your package manager. See the 'Packages that might be needed' section for a list.

Then clone this repo using `git clone https://github.com/flaviusb/build-radio-stuff.git`. Inside the generated `build-radio-stuff` directory, you should run `./build-radio.sh`. 

## Notes

You may have to go through several `make` → identify missing dependancies → `make` cycles. log4cpp and scipy are available in package managers. Install python3 and build-essentials + git, cmake, recent gcc/binutils etc. *Make sure* gnuradio is not already installed via package manager, as this messes up volk detection in gr-foo. If you are on Gentoo, make sure your make.conf flags select the appropriate sse style instructions.

## Packages that might be needed

```
dev-libs/libyaml
dev-libs/log4cpp
dev-python/PyQt5
dev-python/cheetah
dev-python/click
dev-python/click-plugins
dev-python/lxml
dev-python/pip
dev-python/pygsl
dev-python/pygtk
dev-python/pyopengl
dev-python/pyyaml
net-wireless/uhd
sci-libs/gsl
x11-libs/qwt
dev-python/six
sci-libs/fftw
```

Also, you should have a recent version of Python3 installed, and whatever the equivalent of the `build-essentials` package is for your system that provides gcc, make, binutils and so on. You will also need git installed to clone git repos.

## Setting up your USRP devices

You will need to plug in the device via an ethernet port, which must be gigabit ethernet speed. The ethernet device must have its IP address statically set to `192.168.10.1`. There is an included script in this repository called `./setup-devices.sh` that will attempt to do this and then scan for attached USRP devices. If your USRP device is not correctly attached, the GNURadio transmission block will not work.
