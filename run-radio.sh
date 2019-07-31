#!/bin/bash

export SOURCE_BASE=~/autobuild/src/
export BUILD_BASE=~/autobuild/base/

 
PYTHONPATH="$BUILD_BASE/lib/python3.6/dist-packages/" LD_LIBRARY_PATH="$BUILD_BASE/lib/" "$BUILD_BASE/bin/gnuradio-companion"
