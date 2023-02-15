#!/bin/bash

. $HOME/kubetools/minikube.sh

# kubectl

alias kl='kubectl'

# attach (label)

alias klap='kubectl label pods'

# describe

alias kld='kubectl describe'
alias kldd='kubectl describe deployments'

# kldd () {
#     if [[ -z $1 ]]; then
#         kubectl describe deployments
#     else
#         kubectl describe deployment/$1
#     fi
# }

alias kldn='kubectl describe nodes'
alias kldp='kubectl describe pods'

# exec

kle () {
    kubectl exec $1 -- $2
}

kleb () {
    kubectl exec -it $1 -- bash
}

# get

alias klg='kubectl get'

alias klgd='kubectl get deployments'
alias klgdw='kubectl get deployments -o wide'

alias klgn='kubectl get nodes'
alias klgnw='kubectl get nodes -o wide'

alias klgp='kubectl get pods'
alias klgpl='kubectl get pods -l'
alias klgpn="kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"'"'"\n"'"'"}}{{end}}'"
alias klgpw='kubectl get pods -o wide'

alias klgs='kubectl get services'
alias klgsl='kubectl get services -l'

klgsp () {
    if [[ -z $1 ]]; then
        kubectl get services -o go-template='{{range .items}}{{(index .spec.ports 0).nodePort}}{{"\n"}}{{end}}'
    else
        kubectl get services $1 -o go-template='{{(index .spec.ports 0).nodePort}}'
    fi
}

alias klgsw='kubectl get services -o wide'

# logs

alias kll='kubectl logs'

# make (create)

klmd () {
    kubectl create deployment $1 --image=$2
}

# proxy

alias klp='kubectl proxy'

# remove (delete)

alias klr='kubectl delete'

alias klrs='kubectl delete service'
alias klrsl='kubectl delete service -l'

# expose

klxp() {
    port=${2:-8080}
    kubectl expose deployments $1 --type='NodePort' --port $port
}

# ? (version)

alias klz='kubectl version'

# curl extensions

cmbl () {
    curl $(minikube ip):$(klgsp $1)
}
