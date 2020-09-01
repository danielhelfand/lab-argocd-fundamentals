Since your application is set up with the Argo CD server, you are ready 
to deploy it. Go ahead and place a watch on the Pods running in your namespace 
in the first terminal:

```execute-1
watch kubectl get pods
```

This will allow you to watch Argo CD create the pods associated with the Deployment 
for your application.

Run the following command to use Argo CD to sync or deploy your applicaton with the 
latest changes in the application's git repository:

```execute-2
argocd app sync go-web-server-%session_namespace%
```

In the upper terminal, watch as the `go-web-server-%session_namespace%` application 
is deployed by Argo CD. Since the Deployment for this application has two replicas, 
you should see two Pods start running. 

Stop the watch on the Pods once both have a `STATUS` of `Running`:

```execute-1
<ctrl+c>
```

Now check the `Sync Status` of your application:

```execute-1
argocd app get go-web-server-%session_namespace%
```

You should now see the `Sync Status` is updated to `Synced` to the latest commit for 
the git repository. Also, the resources associated with the application have information 
under the `MESSAGE` column confirming the successful creation of the Deployment and Service.

In the next section, you will see how Argo CD continues to monitor the state of your deployed 
application even after the success of the initial deployment.

Clear both terminals before continuing:

```execute-1
clear
```

```execute-2
clear
```

Click **Continuous Monitoring** to continue. 