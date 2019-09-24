#!/bin/bash -e
oc new-project  local-provisioner --description=" local-provisioner" --display-name=" local-provisioner"
oc project local-provisioner

# install
echo "Installing..."
oc create -f configmap.yaml
oc create serviceaccount local-storage-admin
oc adm policy add-scc-to-user privileged -z local-storage-admin
oc create -f local-storage-provisioner-template.yaml

# create app from template
# oc new-app -p CONFIGMAP=local-volume-config \
#   -p SERVICE_ACCOUNT=local-storage-admin \
#   -p NAMESPACE=local-storage \
#   -p PROVISIONER_IMAGE=registry.redhat.io/openshift3/local-storage-provisioner:v3.11 \ 
#   local-storage-provisioner
oc new-app local-storage-provisioner

oc create -f storage-class-sdb.yaml
oc create -f storage-class-sdc.yaml
