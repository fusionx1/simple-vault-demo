#!/bin/bash

kubectl delete -f ./application_deploy_sidecar
helm uninstall mariadb
