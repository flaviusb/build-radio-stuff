# build-radio-stuff

## Notes

You may have to go through several `make` → identify missing dependancies → `make` cycles. log4cpp and scipy are available in package managers. Install python3 and build-essentials + git, cmake, recent gcc/binutils etc. *Make sure* gnuradio is not already installed via package manager, as this messes up volk detection in gr-foo. Make sure your make.conf flags select the appropriate sse style instructions.

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
