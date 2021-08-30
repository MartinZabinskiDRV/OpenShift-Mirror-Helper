#! /usr/bin/env bash

. env-default.sh
. env.sh

# get meta data
oc adm release mirror \
	-a ${LOCAL_SECRET_JSON} \
	--from=quay.io/${PRODUCT_REPO}/${RELEASE_NAME}:${OCP_RELEASE}-${ARCHITECTURE} \
	--to=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY} \
	--to-release-image=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${OCP_RELEASE}-${ARCHITECTURE} \
	--dry-run \
	| tee dry-run.log

# start mirror process
oc adm release mirror \
	-a ${LOCAL_SECRET_JSON} \
	--to-dir=${REMOVABLE_MEDIA_PATH}/mirror quay.io/${PRODUCT_REPO}/${RELEASE_NAME}:${OCP_RELEASE}-${ARCHITECTURE} \
	| tee mirror.log

