#!/bin/sh

#while read pid; do
#	kill $pid
#done <.pids.txt

pkill -afl "48081"
pkill -afl "48082"
pkill -afl live-server
cd fcrepo4-vagrant-4.5.1
vagrant halt
cd ..
