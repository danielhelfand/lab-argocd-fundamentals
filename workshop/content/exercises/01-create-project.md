In order to logically group applications, which is useful when 
Argo CD is used by multiple teams, Argo CD offers the concept of Projects. 

Projects provide the following features:
* restrict what may be deployed (trusted Git source repositories)
* restrict where apps may be deployed to (destination clusters and namespaces)
* restrict what kinds of objects may or may not be deployed (e.g. RBAC, CRDs, DaemonSets, NetworkPolicy etc...)
* defining project roles to provide application RBAC (bound to OIDC groups and/or JWT tokens)

Similar to how Kubernetes by default has a default namespace, Argo CD always starts 
with a Project named default. If no project is defined for an application that is 
registered with Argo CD, that application's project will be the default project. 

Go ahead and create a project with the following specifications:

```execute-1
argocd proj create myproject-%session_namespace% -d https://kubernetes.default.svc,%session_namespace% -s https://github.com/danielhelfand/go-web-server.git
```

By running the command above, you have created a project named `myproject-%session_namespace%`. 

The `-d` flag is short for destination and allows you to specify that applications part of the project you 
just created can only be deployed to certain Kubernetes clusters and namespaces on those clusters. By specifying 
`https://kubernetes.default.svc,%session_namespace%`, your project will allow the deployment of applications to 
the Kubernetes cluster you are currently using and only to the `%session_namespace%` namespace.

The `-s` flag is short for source, which indicates what are trusted sources for an application. In this case, 
the trusted source is a [sample go application](https://github.com/danielhelfand/go-web-server) that you will 
use Argo CD to deploy to your Kubernetes cluster.

Confirm the creation of your project by running the following command:

```execute-1
argocd proj get myproject-%session_namespace%
```

Now that you have a project created, in the next section you will add an application to Argo CD.

Clear your terminal before continuing:

```execute-1
clear
```

Click **Add an Application** to continue.