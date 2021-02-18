#!/bin/env bash
file=/etc/apt/apt.conf
proxy_address="http://proxy.uec.ac.jp:8080"
grep -e '^\#' $file >/dev/null
if [ $? -ne 0 ];then
    sudo sed -i -e 's/\(.*\)/\#\1/g' $file 
    export -n HTTP_PROXY
    export -n HTTPS_PROXY
    export -n http_proxy
    export -n https_proxy
    git config --global --unset http.proxy 
    git config --global --unset https.proxy 
    git config --global --unset url."https://github.com/".insteadOf git@github.com:
    git config --global --unset url."https://".insteadOf git://
    echo proxy on to off
else
    sudo sed -i -e 's/^\#\(.*\)/\1/g' $file 
    export HTTP_PROXY=$proxy_address
    export HTTPS_PROXY=$proxy_address
    export http_proxy=$proxy_address
    export https_proxy=$proxy_address
    git config --global http.proxy $proxy_address 
    git config --global https.proxy $proxy_address 
    git config --global url."https://".insteadOf git://
    git config --global url."https://github.com/".insteadOf git@github.com:
    echo proxy off to on
fi
