# Authn values
export AUTHN_JWT_ID=agentic
export JWT_POLICY_TEMPLATE=authn-jwt.yml.template
export IDENTITY_PATH=data/$AUTHN_JWT_ID		# Conjur policy path to host identity definition
export TOKEN_APP_PROPERTY=sub			# claim containing name of host identity
export WORKLOAD_ID=system:serviceaccount:lg-agent:lg-agent
export JWT_ISSUER=https://kubernetes.default.svc.cluster.local
export JWT_AUDIENCE=https://kubernetes.default.svc.cluster.local
export JWT_APP_POLICY_TEMPLATE=app-authn-jwt.yml.template
export JWT_AUTHN_GRANT_POLICY_TEMPLATE=app-authn-grant.yml.template

# Secrets
export JWT_SECRETS_GRANT_POLICY_TEMPLATE=app-secrets-grant.yml.template
export SAFE_NAME=TestSafe
