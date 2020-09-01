You have now successfully used Argo CD to deploy a container-hosted application to your Kubernetes cluster.

Run the following command to ping the application to get back a response:

```execute-1
curl http://go-web-server-service.%session_namespace%.svc.cluster.local:8080/ArgoCD
```

You should get back a response of `Hi there, I love ArgoCD!`, which confirms a successful deployment.

Click on **Workshop Summary** to finish up the workshop.