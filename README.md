[![Release Charts](https://github.com/uptick/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/uptick/helm-charts/actions/workflows/release.yaml)
# Uptick Helm Charts
This repo contains the public helm charts of the company. Create a chart in the charts folder so they are publicly available as a helm chart to be installed via helm, gitops or terraform.
## How Do I
### Install git precommit hooks
This hook will prevent commits that fail helm lint.

`make git/install-pre-commit-hook`

### Create a chart
`cd charts; helm create *chart_name*`

### Bump a chart version
1. Modify the `version: ` value in `Charts.yaml`.
1. Commit the change and merge to master.
1. The github actions will make a new tag and release for any charts with a detected change.
The changes will appear in the `gh-pages` branch. Any chart will also have a archive created for it and added as an artificat to a github release.

### Install the helm chart
The helm repository is located at https://uptick.github.io/helm-charts/ .

To add the repo: `helm repo add uptick https://uptick.github.io/helm-charts/`

To search the repo `helm search repo uptick --devel` (devel is neccessary for any pre v1 chart)

To see available charts visit https://uptick.github.io/helm-charts/index.yaml