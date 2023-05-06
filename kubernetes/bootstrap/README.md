# Bootstrap

## Generate age key
```bash
age-keygen -o age.agekey
Public key: age1helqcqsh9464r8chnwc2fzj8uv7vr5ntnsft0tn45v2xtz0hpfwq98cmsg
mkdir -p ~/.config/sops/age
mv age.agekey ~/.config/sops/age/keys.txt
```

## Create namespace
```bash
kubectl create ns flux-system
```

## Export age file
```bash
vi ~/.zshrc
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
source ~/.zshrc
sops --encrypt --in-place path/to/secrets.sops.yaml
```

```bash
kubectl apply --kustomize ./kubernetes/bootstrap
cat $SOPS_AGE_KEY_FILE | kubectl -n flux-system create secret generic sops-age --from-file=age.agekey=/dev/stdin
```

## Decrypt cluster secrets and apply them during bootstrap to mitigate racing conditions
```bash
sops --decrypt kubernetes/flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -
```

```bash
kubectl apply --server-side --kustomize ./kubernetes/flux/config
```

## Force reconcile for imidiate bootstrap
```bash
flux reconcile -n flux-system kustomization flux
```

## Force git sync 
```bash
flux reconcile -n flux-system source git home-ops
```
