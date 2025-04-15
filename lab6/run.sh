brew install minikube
brew install kind 

minikube start

kubectl version --clientkubectl get nodes

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm repo add stable https://charts.helm.sh/stable
helm repo update

helm install nfs-server stable/nfs-server-provisioner \
  --set persistence.enabled=true \
  --set persistence.size=1Gi \
  --set storageClass.name=nfs-storage

kubectl get storageclass


kubectl apply -f pvc.yaml
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
kubectl apply -f content-job.yaml

minikube service nginx-service