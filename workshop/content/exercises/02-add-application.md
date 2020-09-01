To add an application to your Argo CD server, you will need to provide 
the following pieces of information:
* The application's Git repository
* The Kubernetes cluster you will deploy the application to
* The namespace on the cluster to deploy the application to

This can be done by running the following command with the Argo CD CLI:

```execute-1
argocd app create go-web-server-%session_namespace% --repo https://github.com/danielhelfand/go-web-server.git --path . --dest-server https://kubernetes.default.svc --dest-namespace %session_namespace% --project myproject-%session_namespace%
```

The command `argocd app create` adds an application named `go-web-server-%session_namespace%` to 
your Argo CD server. The `--repo` flag is used to specify a Git repository for 
the application. `--path` is used to specify the location of the manifests for the application. 

`--dest-server` specifies the URL of the Kubernetes cluster to deploy to. In this case, `https://kubernetes.default.svc` 
represents the current cluster you are using. `--dest-namespace` is used to specify what namespace 
on the cluster to deploy to. The current namespace you are using on your cluster has been set as the destination 
namespace for the application. 

The last piece is the `--project` flag, which adds the application you have created to the project 
you just created.

In the next section, you will learn a bit more about how Argo CD uses the application you just created.

Clear your terminal before continuing:

```execute-1
clear
```

Click **Application Sync Status** to continue.