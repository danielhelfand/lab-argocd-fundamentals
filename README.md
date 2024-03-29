LAB - Argo CD Fundamentals
==========================

This workshop teaches the fundamentals of using [Argo CD](https://argoproj.github.io/argo-cd/) for continuous delivery to Kubernetes. 
In order to use this workshop, you will need to install Argo CD on your cluster, which can be done with the following commands:

```
kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

You will also need to install the edukates operator:

```
kubectl apply -k "github.com/eduk8s/eduk8s-operator?ref=200829.075640.cd9cfa4"
```

**NOTE:** edukates is no longer supported as an open source project. To get this to work, you will need to edit the edukates-operator image to the following: quay.io/eduk8s/eduk8s-operator:200829.075640.cd9cfa4.

1. kubectl edit deployment/eduk8s-operator -n eduk8s
2. Change deployment image to quay.io/eduk8s/eduk8s-operator:200829.075640.cd9cfa4

After Argo CD installs successfully (i.e. all pods in the argocd namespace have a `STATUS` of `Running`), run the following command to access the Argo CD server:

```
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

To deploy the workshop to your cluster, run the shell script [`deploy-workshop.sh`](deploy-workshop.sh).

### Minikube

To install on Minikube, simply run the [`minikube.sh`](minikube.sh) script. This script assumes that Minikube is not running currently. You will still need to run 
[`deploy-workshop.sh`](deploy-workshop.sh) to set up the workshop. 

To access the workshop on Minikube, run `kubectl get trainingportals`. You can then access the workshop via the URL property from the commands output and be able to 
open the workshop in a browser.
