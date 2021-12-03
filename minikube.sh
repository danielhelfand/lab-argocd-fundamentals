minikube start --vm=true
minikube addons enable ingress
kubectl create ns argocd
kapp deploy -a argocd -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v1.7.4/manifests/install.yaml -y
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl apply -k "github.com/eduk8s/eduk8s-operator?ref=200829.075640.cd9cfa4"
kubectl set env deployment/eduk8s-operator -n eduk8s INGRESS_DOMAIN=$(minikube ip).nip.io
