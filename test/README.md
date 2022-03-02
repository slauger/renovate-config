# Tests

## GitHub

```bash
export RENOVATE_PLATFORM=github
export RENOVATE_TOKEN=$(cat ~/.github-token.txt)
export RENOVATE_ARGS=slauger/openshift-sdk
```

## Gitlab

```bash
export RENOVATE_PLATFORM=gitlab
export RENOVATE_TOKEN=$(cat ~/.gitlab-token.txt)
export RENOVATE_ARGS=slauger/openshift-sdk
```

## Gitlab LNX

```bash
export RENOVATE_PLATFORM=gitlab-lnxlabs
export RENOVATE_TOKEN=$(cat ~/.gitlab-token-lnxlabs.txt)
export RENOVATE_ARGS=docker/openshift-sdk
```
