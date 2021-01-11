#!/bin/env bash

kill `ps axu |grep ssh |grep -e 'sol$' |awk '{print $2}' ` 2> /dev/null
if [ $? -ne 0 ];then
    echo 'Dont Kill'
fi

