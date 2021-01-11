#!/bin/env bash

ssh -N -f -D 1080 -q cosmos_sol 
firefox -p DynamicForward_koken > /dev/null &

