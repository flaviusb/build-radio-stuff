# build-radio-stuff

## How to run

Once you have installed this and plugged in your USRP device, you can use `setup_devices.sh` to attempt to configure your USRP device, and you can use `run_radio.sh` to run GNURadio.

The `run_radio.sh` script requires superuser access, as that is needed for GNURadio to create and use TUN/TAP devices.

The `wifi_transceiver.grc` project is a good place to start for transmitting data wrapped in OFDM frames. While it is running, you should be able to connect to the TAP device called 'tap0' (once you have given it an IP address using something like `sudo ifconfig tap0 192.168.200.1`). It is a TAP device, so it will be expecting Ethernet frames; if you want to send IP packets, you will have to send them over Ethernet. The `wifi_transceiver.grc` project does not deal with ARP, so...

## How to install

This assumes you are on reasonably recent distribution of Linux.

Start by installing needed dependencies using your package manager. See the 'Packages that might be needed' section for a list.

Then clone this repo using `git clone https://github.com/flaviusb/build-radio-stuff.git`. Inside the generated `build-radio-stuff` directory, you should run `./build-radio.sh`. 

## Notes

You may have to go through several `./build-radio.sh` → identify missing dependancies → `./build-radio.sh` cycles. log4cpp and scipy are available in package managers. Install python3 and build-essentials + git, cmake, recent gcc/binutils etc. *Make sure* gnuradio is not already installed via package manager, as this messes up volk detection in gr-foo.

## Gentoo extra notes

If you are on Gentoo, make sure your make.conf flags select the appropriate sse style instructions. The `package.use/` directory contains keywords and options for required packages which can be used with the `/etc/portage/package.use/` mechanism.

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
