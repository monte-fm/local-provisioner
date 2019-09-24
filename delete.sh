#!/bin/bash -e
oc project local-provisioner

# reload
oc delete --ignore-not-found=true -f storage-class-sdb.yaml
oc delete --ignore-not-found=true -f storage-class-sdc.yaml
oc delete --ignore-not-found=true -f configmap.yaml
oc delete --ignore-not-found=true -f local-storage-provisioner-template.yaml
oc delete --ignore-not-found=true daemonset local-volume-provisioner
oc delete --ignore-not-found=true ClusterRoleBinding local-storage:provisioner-node-binding
oc delete --ignore-not-found=true ClusterRoleBinding local-storage:provisioner-pv-binding
oc delete --ignore-not-found=true serviceaccount local-storage-admin
oc delete --ignore-not-found=true project local-provisioner
oc project default
