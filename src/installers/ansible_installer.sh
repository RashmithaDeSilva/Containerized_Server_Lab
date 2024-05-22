#!/bin/bash
# Install ansible
# Set up for alpine docker containers


apk update && apk upgrad
apk add ansible
ansible --version