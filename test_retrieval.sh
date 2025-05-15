#!/bin/bash

source env.sh

set -euo pipefail

echo
echo "Authenticate as ${IDENTITY} to get Conjur token"
bot_api_key=$(cat testhost.json | jq . | grep api_key | awk '{print $2}' | tr -d '\r' | tr -d '"')
curl -sk -d "${bot_api_key}" https://localhost:8443/authn/$CONJUR_ACCOUNT/host%2Fdata%2F${IDENTITY}/authenticate > /tmp/conjur_token
echo

echo "Fetch Secret"
CONT_SESSION_TOKEN=$(cat /tmp/conjur_token| base64 | tr -d '\r\n')
VAR_VALUE=$(curl -sk 							\
		-H "Content-Type: application/json"			\
		-H "Authorization: Token token=\"$CONT_SESSION_TOKEN\""	\
		https://localhost:8443/secrets/$CONJUR_ACCOUNT/variable/data%2Fvault%2F${SAFE}%2F${ACCOUNT}%2Fpassword)
  echo "The retrieved value is: $VAR_VALUE"
echo
