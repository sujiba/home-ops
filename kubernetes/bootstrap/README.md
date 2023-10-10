# Bootstrap
### Create Namespace
```
kubectl create ns flux-system

export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt

cat $SOPS_AGE_KEY_FILE | kubectl -n flux-system create secret generic sops-age --from-file=age.agekey=/dev/stdin
```

### Decrypt cluster secrets and apply them during bootstrap to mitigate racing conditions

```
sops --decrypt kubernetes/flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -

kubectl apply -f kubernetes/flux/vars/cluster-settings.yaml

kubectl apply --server-side --kustomize ./kubernetes/flux/config
```

### Force reconile for imidiate bootstrap
```
flux reconcile -n flux-system kustomization flux
```

### Force git sync
```
flux reconcile -n flux-system source git home-ops
```