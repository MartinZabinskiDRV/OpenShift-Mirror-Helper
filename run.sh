#! /usr/bin/env bash

podman pull docker.io/redhat/ubi8

podman run --rm -v $PWD:/oc:z redhat/ubi8 bash /oc/run_c.sh

