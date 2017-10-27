#!/usr/bin/env bash


vagrant up
./start.sh

# initialize the library with the objects from the shelf

vagrant halt

./stop.sh
