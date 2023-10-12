# Install 

alternatives to minikube: [k3s](https://k3s.io/), [microk8s](https://microk8s.io/).

## minikube
    sudo apt install apt-transport-https

    wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube-linux-amd64
    sudo mv minikube-linux-amd64 /usr/local/bin/minikube

## kubectl
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl

### kubectl config

[stackoverflow](https://stackoverflow.com/questions/46184125/how-to-merge-kubectl-config-file-with-kube-config)

    kubectl config view --flatten # output can be appended to .kube/config

    kubectl config view
    kubectl config use-context minikube

# Basic Commands

    minikube start
    kubectl cluster-info
    kubectl get nodes
    kubectl get pods --all-namespaces
    kubectl get events
    minikube ssh
    minikube dashboard
    minikube dashboard --url

    minikube stop
    minikube delete

find out IP of minikube host:

    minikube ssh "route -n | grep ^0.0.0.0 | awk '{ print \$2 }'"


## deploy a container

    kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node
    kubectl get deployments
    kubectl get pods

## expose it as service service
    
    kubectl expose deployment hello-node --type=LoadBalancer --port=8080 
    kubectl get services
    kubectl logs <POD-NAME>

    minikube service hello-node


## Create a deployment with a specific pull-policy

    eval $(minikube docker-env)
    make docker-run # create the docker image

    minikube ssh
    docker images -a # verify the docker image exists

    kubectl create deployment ppc --image="ppc" -o yaml --dry-run   > pcc.yaml  # set spec.template.spec.containers.imagePullPolicy: Never
    kubectl apply -f pcc.yaml

    kubectl expose deployment ppc --type=LoadBalancer --port=8000

## replicas 

    kubectl run test-nginx --image=nginx --replicas=2 --port=80 --expose --service-overrides='{"spec": {"type" : "LoadBalancer"}}'
    kubectl exec -ti test-nginx-959dbd6b6-6m8x7 -- bash

    kubectl run catnip --image=uzak/catnip:latest --port=8080
    kubectl expose deployment catnip --type="LoadBalancer"
    kubectl get services
    kubectl scale deployment catnip --replicas=4

# helm

From [article](https://docs.bitnami.com/kubernetes/get-started-kubernetes/):

helm is composed of two parts: client (Helm) and server (Tiller)
helm chat contains at least 1) a description of the package (chart.yml), one or more templates
examples on google cloud deployment are omitted in this file ...

    kubectl get nodes
    kubectl describe node minikube
    brew install kubernetes-helm
    helm init
    kubectl --namespace kube-system get pods | grep tiller

    export POD_NAME=$(kubectl get pods --namespace default -l "app=redis" -o jsonpath="{.items[0].metadata.name}")
    kubectl port-forward --namespace default $POD_NAME 6379:6379
    redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD

    helm install stable/redis --set serviceType=NodePort
    helm install stable/mongodb --set serviceType=NodePort
    helm install stable/wordpress --set mariadb.image=bitnami/mariadb:10.1.21-r0 --set serviceType=NodePort

    kubectl proxy
    minikube dashboard
    kubectl desribe po # pods

    helm ls
    helm del --purge $(helm ls -q)

Links:

* https://docs.bitnami.com/kubernetes/how-to/
