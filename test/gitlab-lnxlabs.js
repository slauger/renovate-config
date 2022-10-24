module.exports = {
  "platform": "gitlab",
  "endpoint": "https://git.lnxlabs.de/api/v4/",
  "extends": [
    "github>slauger/renovate-config:base"
  ],
  "regexManagers": [
    {
      "fileMatch": [
        "(^|/)globals.yaml"
      ],
      "matchStrings": [
        "[ \\t]+.*:[ \\t](?<depName>[a-z0-9\\-\\.\\/]+)(:(?<currentValue>[a-z0-9\\-\\.]+))?(@(?<currentDigest>sha256:[a-f0-9]+))?\\s"
      ],
      "datasourceTemplate": "docker"
    }
  ]
}
