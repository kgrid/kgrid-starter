#!/bin/sh

while read pid; do
	kill $pid
done <.pids.txt

cd fcrepo4-vagrant-4.5.1
vagrant halt
cd ..