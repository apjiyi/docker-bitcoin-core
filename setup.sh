#!/bin/bash

UNAME=`uname`
if [ $UNAME == "Darwin" ] ; then
    DIR_PATH=$(cd "$(dirname "$0")"; pwd)
else
    DIR_PATH=$(dirname $(readlink -f $0))
fi

mkdir -p $DIR_PATH/conf/core01/
mkdir -p $DIR_PATH/conf/core02/
cp $DIR_PATH/bitcoin.conf.default $DIR_PATH/conf/core01/bitcoin.conf
cp $DIR_PATH/bitcoin.conf.default $DIR_PATH/conf/core02/bitcoin.conf
sed -i "s/^addnode=.*/addnode=core02:7786/g" $DIR_PATH/conf/core01/bitcoin.conf
sed -i "s/^addnode=.*/addnode=core01:7786/g" $DIR_PATH/conf/core02/bitcoin.conf

