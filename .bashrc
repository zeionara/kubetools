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
alias klgnw='kubectl get nodes -o wide'

alias klgd='kubectl get deployments'
alias klgdw='kubectl get deployments -o wide'

alias klgp='kubectl get pods'
alias klgpw='kubectl get pods -o wide'
alias klgpn="kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"'"'"\n"'"'"}}{{end}}'"

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
