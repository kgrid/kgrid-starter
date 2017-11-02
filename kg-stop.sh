#!/bin/sh


BASEDIR=$(dirname "$0")
cd $BASEDIR

pkill -afl "48081"
pkill -afl "48082"
pkill -afl live-server
cd fcrepo4-vagrant-4.5.1
vagrant halt
cd ..
