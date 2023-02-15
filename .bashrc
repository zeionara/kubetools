#!/bin/bash

# minikube

alias mb='minikube'

# up (start)

alias mbu='minikube start'

# stop

alias mbs='minikube stop'

# version

alias mbz='minikube version'

# kubectl

alias kl='kubectl'

# describe

alias kldd='kubectl describe deployments'
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

alias klgd='kubectl get deployments'
alias klgdw='kubectl get deployments -o wide'

alias klgn='kubectl get nodes'
alias klgnw='kubectl get nodes -o wide'

alias klgp='kubectl get pods'
alias klgpn="kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"'"'"\n"'"'"}}{{end}}'"
alias klgpw='kubectl get pods -o wide'

# logs

alias kll='kubectl logs'

# make (create)

klmd () {
    kubectl create deployment $1 --image=$2
}

# proxy

alias klp='kubectl proxy'

# version

alias klz='kubectl version'
