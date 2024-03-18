## create a secret for external dns

export CIVO_TOKEN=$CIVO_TOKEN

cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: external-dns
---
apiVersion: v1
kind: Secret
metadata:
  name: external-dns-secrets
  namespace: external-dns
type: Opaque
stringData:
  token: $CIVO_TOKEN
EOF