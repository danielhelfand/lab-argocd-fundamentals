# Get ArgoCD Server password and add as environment variable for each workshop session
ARGOCD_SERVER_PASSWORD=`kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2`
sed -i '' "s|REPLACE_PASSWORD|$ARGOCD_SERVER_PASSWORD|" resources/workshop.yaml

# Get ArgoCD Server endpoint and add as environment variable for each workshop session
ARGOCD_SERVER_ENDPOINT=`kubectl get svc/argocd-server -n argocd -o template --template '{{.spec.clusterIP}}'`
sed -i '' "s|REPLACE_ENDPOINT|$ARGOCD_SERVER_ENDPOINT|" resources/workshop.yaml

# Create workshop session
kubectl apply -k .