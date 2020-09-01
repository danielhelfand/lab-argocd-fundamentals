Your application has now been successfully deployed to Kubernetes, but 
what happens when you want to update what is deployed to your namespace? 
And what happens if your application falls back `OutOfSync`?

To demonstrate, place a watch on the application in your upper terminal:

```execute-1
watch argocd app get go-web-server-%session_namespace%
```

Now delete the Deployment associated with the application:

```execute-2
kubectl delete deployment go-web-server-deployment
```

After deleting the Deployment, check the `Sync Status` of your application in the 
upper terminal.

You will notice the `Sync Status` is once again `OutOfSync`, and the resources 
associated with the application show the Deployment is `OutOfSync` but the Service 
is still `Synced` with the latest changes in the application git repository.

Getting the application back in a `Synced` state is as simple as re-running the command below:

```execute-2
argocd app sync go-web-server-%session_namespace%
```

In the upper terminal, you should now see the application return to a `Synced` state. Once the application 
is back in a `Synced` state, break the watch on the application in the upper terminal:

```execute-1
<ctrl+c>
```

In the next section, you will verify the application is running as expected after its deployment. 

Clear both terminals before continuing:

```execute-1
clear
```

```execute-2
clear
```

Click **Verify Deployment** to continue. 