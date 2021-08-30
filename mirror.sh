#! /usr/bin/env bash

. env-default.sh
. env.sh

# start mirror process
oc adm release mirror \
	-a ${LOCAL_SECRET_JSON} \
	--to-dir=${REMOVABLE_MEDIA_PATH}/mirror quay.io/${PRODUCT_REPO}/${RELEASE_NAME}:${OCP_RELEASE}-${ARCHITECTURE}

