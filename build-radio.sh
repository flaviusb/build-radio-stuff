#!/bin/bash

export SOURCE_BASE=~/autobuild/src/
export BUILD_BASE=~/autobuild/base/

mkdir -p "$SOURCE_BASE"
mkdir -p "$BUILD_BASE"

cd "$SOURCE_BASE"
git clone --recurse-submodules https://www.gnuradio.org/cgit/gnuradio.git/
cd gnuradio
mkdir build
cd build
cmake -DPYTHON-EXECUTABLE=/usr/bin/python3 -DCMAKE_INSTALL_PREFIX="$BUILD_BASE" -DENABLE_GRC=ON -DENABLE_GR_UHD=ON -DENABLE_GR_QTGUI=ON ../ && make && make test && make install
if [ $? -ne 0 ]
then
  exit -1
fi

cd "$SOURCE_BASE"
#git clone https://github.com/bastibl/gr-foo.git -b master --single-branch
git clone https://github.com/flaviusb/gr-foo.git -b patch-1 --single-branch
cd gr-foo
mkdir build
cd build
cmake -DPYTHON-EXECUTABLE=/usr/bin/python3 -DCMAKE_INSTALL_PREFIX="$BUILD_BASE" ../ && make && make install
if [ $? -ne 0 ]
then
  exit -1
fi

cd "$SOURCE_BASE"
git clone https://github.com/bastibl/gr-ieee802-11.git -b master --single-branch
cd gr-ieee802-11
mkdir build
cd build
cmake -DPYTHON-EXECUTABLE=/usr/bin/python3 -DCMAKE_INSTALL_PREFIX="$BUILD_BASE" ../ && make && make install
if [ $? -ne 0 ]
then
  exit -1
fi

