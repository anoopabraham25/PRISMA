#!/bin/sh

apt-get install gcc g++ python3

apt-get install libzmq5 libzmq5-dev
apt-get install libprotobuf-dev
apt-get install protobuf-compiler

cd prisma/
cd ns3gym/
sh compile_proto.sh