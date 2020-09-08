# kubectl-aws-session-plugin

A kubectl plugin to add aws-session credentials to a Kubernetes Secret

## Requirements 

Requires AWS credentials. Can be any valid credentials in the [AWS Default Credential Provider Chain](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/credentials.html)

## Installation and Usage

### Install 

Download the [latest](https://github.com/isaaguilar/kubectl-aws-session-plugin/releases/latest) or build the binary by running `make`. Copy the binary in your `$PATH`. (ie `/usr/local/bin/kubectl-aws-session` should work for linux/osx user.)

### Usage 

With valid AWS credentials, simply run the kubectl plugin by running:

```bash
$ kubectl aws session
```

You can define a namespace using `--namespace` or `-n`.

```bash
$ kubectl aws session --namespace dev
```

## Contributions

PRs are welcomed!
