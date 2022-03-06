#!/bin/bash
sed "s/tagversion/$1/g" k8s/apps/k8s-deployments.yaml > k8s/apps/k8s-newtag-deployments.yaml