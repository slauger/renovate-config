module.exports = {
  "platform": "github",
  "extends": [
    "github>slauger/renovate-config"
  ],
  "packageRules": [
    {
      "matchPackageNames": ["quay.io/openshift-release-dev/ocp-release"],
      "extractVersion": "^v?(?<version>4\.([0-9\.]+).([0-9\.]+))-x86_64$"
    }
  ]
}
