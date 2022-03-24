#!/bin/bash
echo "$(date +'%Y-%m-%d %H:%M:%S')  patched" >> /home/akdc/status

# pull the latest git updates
git -C ~/gitops pull
git -C ~/fleet pull

echo "$(hostname) patched"
