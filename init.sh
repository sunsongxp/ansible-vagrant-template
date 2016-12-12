#!/bin/bash

mkdir -p templates
mkdir -p host_vars

ansible-galaxy install -r requirements.yml -p roles
vagrant up --provision
vagrant halt
vagrant snapshot save latest
