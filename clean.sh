#!/bin/bash

. build.config

rm -fr build
rm -f $LOGS

cd openssh-6.8p1

make distclean
