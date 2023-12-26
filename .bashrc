#!/bin/bash

. $HOME/kubetools/minikube.sh

# kubectl

alias kl='kubectl'

# apply

alias kla='kubectl apply -f'

# boot (rollout) status

klbs () {
    kubectl rollout status deployments/$1
}

klbu () {
    kubectl rollout undo deployments/$1
}

# change (set)

klci () {
    kubectl set image deployments/$1 $2
}

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
alias klds='kubectl describe services'

# exec

kle () {
    kubectl exec $1 -- ${@:2}
}

kleb () {
    kubectl exec -it $1 -- bash
}

# flag (label)

alias klfp='kubectl label pods'

# get

alias klg='kubectl get'

alias klgd='kubectl get deployments'
alias klgdw='kubectl get deployments -o wide'
alias klgi='kubectl get ingress'

alias klgn='kubectl get nodes'
alias klgnw='kubectl get nodes -o wide'

alias klgp='kubectl get pods'
alias klgpl='kubectl get pods -l'
alias klgpn="kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"'"'"\n"'"'"}}{{end}}'"
alias klgpw='kubectl get pods -o wide'

alias klgpnv='kubectl get pods -n nvidia-device-plugin'

alias klgr='kubectl get rs'

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

# cluster info

alias kli="kubectl cluster-info"

# contexts (kontexts)

alias klkl='kubectl config get-contexts'
alias klkc='kubectl config current-context'

klku () {
    _context_index="$1"

    if test -z "$_context_index"; then
        echo 'context index is missing'
        exit 1
    fi

    kubectl config use-context $(kubectl config get-contexts | head -n $((_context_index + 1)) | tail -n 1 | awk '{print $1}')
}

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

alias klrd='kubectl delete deployment'
alias klrp='kubectl delete pod'

# scale

kls () {
    kubectl scale deployments/$1 --replicas=$2
}

# top

alias klt='kubectl top'
alias kltn='kubectl top node'
alias kltp='kubectl top pod'

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
