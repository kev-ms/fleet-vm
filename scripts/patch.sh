#!/bin/bash
echo "$(date +'%Y-%m-%d %H:%M:%S')  patched" >> /home/akdc/status

# pull the latest docker images
docker pull ghcr.io/cse-labs/webv-red:latest
docker pull ghcr.io/cse-labs/webv-red:beta

kubectl create secret generic fluent-bit-vtlog-secret --from-literal="EventHubConnectionString=Endpoint=sb://corp-monitoring-eh.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=BVSamLwcySNBamYymanDvKBfrO4r8YjLXgMNgIs7fzw=" -n vtlog

echo "$(hostname) patched"
