#!/bin/bash
set -v

cd mariadb
./mariadb.sh
cd ..
kubectl wait --timeout=120s --for=condition=Ready $(kubectl get pod --selector=app=mariadb -o name)
sleep 1s

cd vault
./vault_setup.sh
cd ..
sleep 5s

kubectl apply -f ./application_deploy_sidecar
kubectl get svc k8s-transit-app

