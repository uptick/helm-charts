TG_VERSION ?= v0.27.0
TF_VERSION ?= 0.14.2
INSTALL_PATH ?= /usr/local/bin/
TERRAGRUNT_DOWNLOAD ?= ~/.terragrunt-cache/
CLUSTER ?=

# Print this help message
help:
	@echo
	@awk '/^#/ {c=substr($$0,3); next} c && /^([a-zA-Z].+):/{ print "  \033[32m" $$1 "\033[0m",c }{c=0}' $(MAKEFILE_LIST) |\
	sort |\
	column -s: -t |\
	less -R

# Helm lint  all charts
lint:
	helm lint charts/*


# Debug pod-killer
debug/pod-killer:
	helm install --debug --dry-run pod-killer ./charts/pod-killer

# Install pod-killer
install/pod-killer:
	helm upgrade --install pod-killer ./charts/pod-killer

# Uninstall pod-killer
uninstall/pod-killer:
	helm uninstall pod-killer

# Install git precommit hooks for auto validation
git/install-pre-commit-hook:
	echo "#!/bin/sh\n make lint " > .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
