#!/bin/bash
set -eou pipefail

source ../env/conjur-oss.sh
source ./demo-vars.sh

cat ./templates/$JWT_APP_POLICY_TEMPLATE			\
  | sed -e "s#{{ AUTHN_JWT_ID }}#$AUTHN_JWT_ID#g"		\
  | sed -e "s#{{ WORKLOAD_ID }}#$WORKLOAD_ID#g"			\
  | sed -e "s#{{ TOKEN_APP_PROPERTY }}#$TOKEN_APP_PROPERTY#g"	\
  > ./policy/$JWT_APP_POLICY_TEMPLATE

../coss-cli.sh append /data ./policy/$JWT_APP_POLICY_TEMPLATE

cat ./templates/$JWT_AUTHN_GRANT_POLICY_TEMPLATE		\
  | sed -e "s#{{ AUTHN_JWT_ID }}#$AUTHN_JWT_ID#g"		\
  > ./policy/$JWT_AUTHN_GRANT_POLICY_TEMPLATE

../coss-cli.sh append /conjur/authn-jwt ./policy/$JWT_AUTHN_GRANT_POLICY_TEMPLATE

cat ./templates/$JWT_SECRETS_GRANT_POLICY_TEMPLATE		\
  | sed -e "s#{{ AUTHN_JWT_ID }}#$AUTHN_JWT_ID#g"		\
  | sed -e "s#{{ SAFE_NAME }}#$SAFE_NAME#g"			\
  > ./policy/$JWT_SECRETS_GRANT_POLICY_TEMPLATE

../coss-cli.sh append /data ./policy/$JWT_SECRETS_GRANT_POLICY_TEMPLATE
