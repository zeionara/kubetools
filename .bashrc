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

# get

alias klgn='kubectl get nodes'
alias klgd='kubectl get deployments'

# describe

alias kldn='kubectl describe nodes'
alias kldd='kubectl describe deployments'

# make (create)

klmd () {
    kubectl create deployment $1 --image=$2
}

# proxy

alias klp='kubectl proxy'

# version

alias klz='kubectl version'
