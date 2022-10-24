# Renovate Config

These are some [Sharable Renovate Configs] for my personal projects.

## Usage
                                   
Just add the respective `extends` to your [Renovate Config].

### Default Preset (enables everything to my personal liking)

```json
{
  "extends": [
    "github>slauger/renovate-config"
  ]
}
```

### Include a specific preset

```json
{
  "extends": [
    "github>slauger/renovate-config:presetname"
  ]
}
```

## Presets

### `regex-comments`

Adds support for renovation of:

* `ENV`/`ARG` values within a `Dockerfile`
* `_VERSION` values within a `Makefile`
* Module versions within a `Puppetfile`
* Provider versions within a `terragrunt.hcl` template
* `vars` within `.gitlab-ci.yml`

#### Dockerfile

```dockerfile
FROM alpine:latest

# renovate: datasource=github-releases depName=kubernetes/kubernetes
ENV KUBERNETES_VERSION=1.23.0 
```

#### Makefile

```yaml
# renovate: datasource=github-releases depName=kubernetes/kubernetes
export KUBERNETES_VERSION=1.23.0
```

#### Puppetfile

```yaml
mod "stdlib",
  :git => "https://github.com/puppetlabs/puppetlabs-stdlib",
  # renovate: datasource=github-releases depName=puppetlabs/puppetlabs-stdlib versioning=loose
  :tag => "v8.1.0"
```

#### terragrunt.hcl

```hcl
generate "terraform" {
  path      = "terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "~> v1.1.0"

  required_providers {
    acme = {
      source  = "vancluever/acme"
      # renovate: datasource=github-releases depName=vancluever/terraform-provider-acme versioning=loose extractVersion=^v?(?<version>.*)$
      version = "2.8.0"
    }
  }
}
EOF
}

```

#### .gitlab-ci.yml

```yaml
vars:
  # renovate: datasource=github-releases depName=kubernetes/kubernetes
  KUBERNETES_VERSION: 1.23.0
```

[Sharable Renovate Configs]: https://docs.renovatebot.com/config-presets/
[Renovate Config]: https://docs.renovatebot.com/configuration-options/
