PKG ?= github.com/isaaguilar/kubectl-aws-session-plugin
VERSION ?= $(shell if git status |grep "nothing to commit\|nothing added to commit" >/dev/null;then git tag --points-at HEAD|cat; fi)
ifeq ($(VERSION),)
VERSION := v0.0.0
endif
OS := $(shell uname -s | tr A-Z a-z)

PLUGIN_SET_AWS_SESSION = aws-session
PLUGIN_SET_AWS_SESSION_VER = ${VERSION}
PLUGIN_SET_AWS_SESSION_NAME = kubectl-${PLUGIN_SET_AWS_SESSION}
PLUGIN_SET_AWS_SESSION_NAME_VER = ${PLUGIN_SET_AWS_SESSION_NAME}-${PLUGIN_SET_AWS_SESSION_VER}

all: build-linux build

build:
	env GOOS=darwin GOARCH=amd64 go build -i -v -o bin/${PLUGIN_SET_AWS_SESSION_NAME}-darwin -ldflags="-X main.version=${PLUGIN_SET_AWS_SESSION_VER}" ./main.go
	cd bin && mv ${PLUGIN_SET_AWS_SESSION_NAME}-darwin ${PLUGIN_SET_AWS_SESSION_NAME} && tar czf ${PLUGIN_SET_AWS_SESSION_NAME_VER}-darwin.tgz ${PLUGIN_SET_AWS_SESSION_NAME}

build-linux:
	env GOOS=linux  GOARCH=amd64 go build -i -v -o bin/${PLUGIN_SET_AWS_SESSION_NAME}-linux  -ldflags="-X main.version=${PLUGIN_SET_AWS_SESSION_VER}" ./main.go
	cd bin && mv ${PLUGIN_SET_AWS_SESSION_NAME}-linux  ${PLUGIN_SET_AWS_SESSION_NAME} && tar czf ${PLUGIN_SET_AWS_SESSION_NAME_VER}-linux.tgz  ${PLUGIN_SET_AWS_SESSION_NAME}
# TODO Automate a github release

.PHONY: build push
