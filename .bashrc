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

alias kld='kubectl describe'

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

alias klg='kubectl get'

alias klgd='kubectl get deployments'
alias klgdw='kubectl get deployments -o wide'

alias klgn='kubectl get nodes'
alias klgnw='kubectl get nodes -o wide'

alias klgp='kubectl get pods'
alias klgpn="kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"'"'"\n"'"'"}}{{end}}'"
alias klgpw='kubectl get pods -o wide'

alias klgs='kubectl get services'

klgsp () {
    if [[ -z $1 ]]; then
        kubectl get services -o go-template='{{range .items}}{{(index .spec.ports 0).nodePort}}{{"\n"}}{{end}}'
    else
        kubectl get services/$1 -o go-template='{{(index .spec.ports 0).nodePort}}'
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

# expose

klxp() {
    port=${2:-8080}
    kubectl expose deployments/$1 --type='NodePort' --port $port
}

# ? (version)

alias klz='kubectl version'
