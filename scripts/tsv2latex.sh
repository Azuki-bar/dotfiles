#!/bin/env bash

xsel -bo |sed -e "s/\t/\&  /g" | sed -e "s/$/\\\\\\\\/g" | xsel -bi |xsel -bo 
