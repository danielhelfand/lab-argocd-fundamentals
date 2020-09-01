In this self-paced tutorial, you will learn about Argo CD and use it to 
deploy an application to a Kubernetes cluster.

Argo CD follows the GitOps pattern of using Git repositories as the source 
of truth for defining an application's desired state. By committing to the 
idea that a software project's Git repository, or any other version control, 
is the source of truth, development teams/communities can all have a shared 
understanding about a project's current state. 

Argo CD builds off this idea for managing how an application is deployed to Kubernetes. If 
the latest changes in a project's Git repository are not deployed, the deployed application 
is considered out of sync. Argo CD keeps track of a Git repository's changes, and there are a 
number of different approaches that Argo CD can use to keep an application in sync.

To support different deployment approaches around Kubernetes, Argo CD allows users to define 
Kubernetes manifests (i.e. declarations of Kubernetes resouces used to support an application) 
in a project's Git repository in a variety of formats:
* kustomize applications
* helm charts
* ksonnet applications
* jsonnet files
* Plain directory of YAML/json manifests
* Any custom config management tool configured as a config management plugin

Argo CD recognizes these manifests and uses them to deploy software projects to Kubernetes. This 
deployment can be to the Kubernetes cluster hosting Argo CD or to an external cluster.

To start, login to the Argo CD server using the `argocd` CLI:

```execute-1
argocd login $ARGOCD_SERVER_ENDPOINT --username admin --password $ARGOCD_SERVER_PASSWORD --insecure
```

The environment variable `ARGOCD_SERVER_ENDPOINT` contains the endpoint you will use to access the 
server running on your Kubernetes cluster. `ARGOCD_SERVER_PASSWORD` contains the password to access 
the server for the `admin` user.

Now that you are authenticated, in the next section, you will learn how to create a project to separate 
your application from others that are managed by the Argo CD server. 

Clear your terminal before continuing:

```execute-1
clear
```

Click **Create a Project** to continue. 