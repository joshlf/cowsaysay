#!/bin/bash

# Copyright 2013 The Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

if [ $# -ne 2 -a $# -ne 4 ]
then
	echo "Usage: $0 [-T tongue] <n> <text>"
	exit 1
elif [ $# -eq 4 -a $1 != '-T' ]
then
	echo "Usage: $0 [-T tongue] <n> <text>"
        exit 1
fi

if [ $# -eq 2 ]
then
	ARGS=-n
	TEXT=$2
	NUM=$1
else
	ARGS="-n -T $2"
	TEXT=$4
	NUM=$3
fi

if [ $NUM -eq 0 ]
then
	echo $TEXT $ARGS | cowsay
	exit 0
fi

TMP1=/tmp/cowsaysay$$_1.tmp
TMP2=/tmp/cowsaysay$$_2.tmp

echo $TEXT > $TMP1

for i in `seq 1 $NUM`
do
	cowsay $ARGS <$TMP1 >$TMP2	
	mv $TMP2 $TMP1
done

cat $TMP1
rm $TMP1
