#!/bin/bash

. build.config

if [ ! -d "$BUILD_DIR" ]; then
	mkdir "$BUILD_DIR"
fi

cd openssh-6.8p1

echo Running configure...
./configure --prefix=$BUILD_DIR >$CONFIG_LOG
if [ $? -ne 0 ]; then
	echo Error while running configure
	exit 1
fi

echo Running make...
make >$MAKE_LOG
if [ $? -ne 0 ]; then
	echo Error while running make
	exit 1
fi

echo Running make install...
make install >$INSTALL_LOG
if [ $? -ne 0 ]; then
	echo Error while running make install
	exit 1
fi

echo Run the server with:
echo $PROJECT_DIR/build/sbin/sshd -D
