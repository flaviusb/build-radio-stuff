#!/bin/bash

set -e

sudo ifconfig eth0 192.168.10.1

uhd_find_devices
