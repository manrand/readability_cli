#!/bin/bash

if [ -f /.dockerenv ]; then
    echo TRUE
    exit 0
else
    echo FALSE
    exit 1
fi
