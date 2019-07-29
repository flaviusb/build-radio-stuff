# build-radio-stuff

## Notes

You may have to go through several `make` → identify missing dependancies → `make` cycles. log4cpp and scipy are available in package managers. Install python3 and build-essentials + git, cmake, recent gcc/binutils etc. *Make sure* gnuradio is not already installed via package manager, as this messes up volk detection in gr-foo. Make sure your make.conf flags select the appropriate sse style instructions.
