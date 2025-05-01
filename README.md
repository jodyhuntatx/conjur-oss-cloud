# Conjur OSS that simulates Conjur Cloud for local testing

Prerequisites:
 - jq
 - docker
 - docker-compose

To get started, run the start-conjur script.
IT WILL FIRST DESTROY A RUNNING CONJUR INSTANCE.
Use ctrl-C to exit if that's not what you want.

The script automates the first steps of Conjur OSS Quickstart and initializes 
the Conjur instance with:
   - user: admin:CyberArk11@@
   - /conjur and /data base branches
   - /conjur/authn-* branches for authenticators
   - /data/vault branch for simulated vault synchronizer artifacts
   - /data/vault/TestSafe/delegation/consumers group
   - /data/vault/TestSafe/MySQL-DB/* variables
   - /data/dbAgent1 host identity with API key authentication

All initialization policies are in the policy/ directory. You can use these
as templates to define your own artifacts as needed.

The script coss-cli.sh is a bash CLI that supports main Conjur admin functions.
The start-conjur script uses it for all initialization steps except admin
user setup. There is a conjur_client container that has the full Conjur CLI
installed. If coss-cli.sh doesn't get the job done, you can exec into that
container and run admin commands there.

The k8s-jwt-setup directory has scripts to initialize an authn-jwt endpoint and
creates a k8s host identity. It can be used as an example of how to setup JWT
authentication.
