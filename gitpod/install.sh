#!/bin/sh

# clean workspace folder
rm -rf /workspace/gvisor-tap-vsock
mkdir /workspace/gvisor-tap-vsock
ln -s /workspace/gvisor-tap-vsock ~/Projects
git init /workspace/gvisor-tap-vsock

cd ~/Projects

exit 0
