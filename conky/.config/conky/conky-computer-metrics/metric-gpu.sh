#!/bin/env bash

# Get GPU
mygpu="not found"
# Check number of GPUs
if [ $(lspci | grep VGA | wc -l) -eq 1 ]; then
    # One GPU
    mygpu=$(lspci | grep VGA | sed -n 's/.*\[\(.*\)\].*/\1/p')
else
    # multi-gpu
    if [[ $(lspci | grep VGA | grep NVIDIA) ]]; then
        # NVIDIA GPU
        mygpu=$(lspci | grep VGA | grep NVIDIA | sed -n 's/.*\[\(.*\)\].*/\1/p')
    else
        # AMD GPU
        mygpu=$(lspci | grep VGA | grep AMD | sed -n 's/.*\[\(.*\)\].*/\1/p')
    fi
fi

echo $mygpu

