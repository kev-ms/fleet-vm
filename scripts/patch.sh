#!/bin/bash
echo "$(date +'%Y-%m-%d %H:%M:%S')  patched" >> /home/akdc/status

# pull the latest docker images
docker pull ghcr.io/cse-labs/webv-red:latest
docker pull ghcr.io/cse-labs/webv-red:beta

# set fluent-bit secret for forwarding to event hub
kubectl create secret generic fluentbit-eventhub-secret --from-literal="EventHubConnectionString=Endpoint=sb://corp-monitoring-eh.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=BVSamLwcySNBamYymanDvKBfrO4r8YjLXgMNgIs7fzw=" -n fluent-bit

echo "$(hostname) patched"
