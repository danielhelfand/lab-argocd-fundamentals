In the previous section you created an application with Argo CD. Let's take a look 
at exactly what that means. Execute the command below to see more information about 
the application you created:

```execute-1
argocd app get go-web-server-%session_namespace%
```

In the information returned about `go-web-server-%session_namespace%`, there should be 
a property called `Sync Status`. This indicates whether the latest changes in the git 
repository for your application are up to date on your Kubernetes cluster. 

The status should currently be `OutOfSync`. Every application with Argo CD should start 
with an `OutOfSync` status since it has never been deployed to your cluster. Once you 
deploy your application in the next section, this sync status will change to reflect that 
the latest changes in the git repostitory for `go-web-server-%session_namespace%` have been 
deployed.

The other thing to note is that Argo CD is aware of the Kubernetes resources to deploy 
to support the `go-web-server-%session_namespace%` application. You should something similar 
to the following displayed in the information:

```
GROUP  KIND        NAMESPACE  NAME                      STATUS     HEALTH   HOOK  MESSAGE
       Service     default    go-web-server-service     OutOfSync  Missing        
apps   Deployment  default    go-web-server-deployment  OutOfSync  Missing 
```

The information above indicates that the git repository for `go-web-server-%session_namespace%` 
holds Kubernetes manifests that declare to deploy a Kubernetes [Service](https://kubernetes.io/docs/concepts/services-networking/service/) 
and [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/). This information 
matches what is [declared in the repository](https://github.com/danielhelfand/go-web-server/blob/master/k8s.yaml):

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: go-web-server-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: go-web-server
  template:
    metadata:
      labels:
        app: go-web-server
    spec:
      imagePullSecrets:
      - name: registry-credentials
      containers:
      - name: go-web-server
        image: danielhelfand/go-web-server:latest
        imagePullPolicy: Always
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: go-web-server-service
  labels:
    app: go-web-server
spec:
  type: NodePort
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
  selector:
    app: go-web-server
```

Argo CD is able to recognize the YAML files declared in the repository to know what resources to deploy to 
your Kubernetes cluster. Now that Argo CD has information about the Deployment and associated Service for your 
application, in the next section you will use Argo CD to deploy your application to your namespace.

Clear your terminal before continuing:

```execute-1
clear
```

Click **Deploy an Application** to continue.