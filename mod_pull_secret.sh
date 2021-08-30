#! /usr/bin/env bash

. env-default.sh
. env.sh

MIRROR_REGRESTRY_TOKEN="$(echo -n "$MIRROR_USER:$MIRROR_PASS" | base64 -w0)"

FILTER=".auths=( {\"$REG_URL\": { \"auth\": \"$MIRROR_REGRESTRY_TOKEN\", \"email\": \"$MAIL\" } } + .auths)"
cat "$PULL_SECRET_FILE" | jq "$FILTER" >"$PULL_SECRET_COPY"

