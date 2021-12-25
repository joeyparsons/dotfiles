#!/bin/bash

PROTOCVERSION=${1}
if [ -z "${PROTOCVERSION}" ]; then
  PROTOCVERSION=3.19.1
fi

mkdir -p /tmp/protoc/

wget https://github.com/google/protobuf/releases/download/v${PROTOCVERSION}/protoc-${PROTOCVERSION}-osx-x86_64.zip -P /tmp/;
unzip /tmp/protoc-${PROTOCVERSION}-osx-x86_64.zip -d /tmp/protoc;
rm -f /tmp/proroc-${PROTOCVERSION}-osx-x86_64.zip
sudo cp -rfp /tmp/protoc/bin/protoc /usr/local/bin
rm -rf /tmp/protoc;
