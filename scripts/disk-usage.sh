#!/bin/bash

df -B GB --output=source,size,used,avail,pcent,target "$@"
