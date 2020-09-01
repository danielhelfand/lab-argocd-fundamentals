minikube start
minikube addons enable ingress
kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/master/manifests/install.yaml
# Sleep so Argo CD pods become available
sleep 20
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl apply -k "github.com/eduk8s/eduk8s-operator?ref=master"
kubectl set env deployment/eduk8s-operator -n eduk8s INGRESS_DOMAIN=$(minikube ip).nip.io