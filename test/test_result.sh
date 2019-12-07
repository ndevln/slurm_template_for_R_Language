#!/bin/bash

count=`ls -1 *.RData 2>/dev/null | wc -l`
if [ $count == 2 ]
then
    echo test pass
    exit 0
else
    echo test fail
    exit 1
fi