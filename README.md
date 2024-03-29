

### Create git repo
```
git init
git add .
git commit -m "first commit"
```

### Initialise and install dependencies
```
brew install go-task/tap/go-task

# Install dependencies
task init

# Configure PreCommit
task precommit:init
task precommit:run
task precommit:update
```

### Prepare hosts and install cluster
```
task ansible:init
task ansible:list
task ansible:ping
task ansible:prepare
task ansible:install
task ansible:uptime

# Destroy cluster with
task ansible:nuke
```

### Create age key
```
age-keygen -o age.agekey
```

### Move age key to sops directory
```
mkdir -p ~/.config/sops/age
mv age.agekey ~/.config/sops/age/keys.txt
```

### Export age key for k8s secrets
```
vi ~/.zshrc
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
source ~/.zshrc
```

### Bootstrap cluster
[Bootstrap](kubernetes/bootstrap/README.md)
