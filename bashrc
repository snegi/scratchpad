# operator env vars
export GOPATH=$HOME/odev
export GOBIN=$GOPATH/bin
export PROMETHEUSPATH=/Users/satyarthnegi/Workspace/prometheus/prometheus-2.3.2.darwin-amd64
export PATH=$PATH:$GOBIN:$PROMETHEUSPATH
export COROOT=$GOPATH/src/github.com/crunchydata/postgres-operator
export CO_BASEOS=centos7
export CO_VERSION=2.5
export CO_IMAGE_PREFIX=crunchydata
export CO_IMAGE_TAG=$CO_BASEOS-$CO_VERSION
export CO_NAMESPACE=demo
export CO_CMD=kubectl
export CO_APISERVER_URL=https://127.0.0.1:8443
export PGO_CA_CERT=$COROOT/conf/apiserver/server.crt
export PGO_CLIENT_CERT=$COROOT/conf/apiserver/server.crt
export PGO_CLIENT_KEY=$COROOT/conf/apiserver/server.key

export PATH=$PATH:/Users/satyarthnegi/Workspace/yaml-editor/bin

export AZURE_SUBSCRIPTION_ID=016c8074-e2bb-4eb5-b4b4-d86c4aa740fa
export AZURE_CLIENT_ID=10d28313-7de9-4d1d-a1e3-cd366e8ae65a
export AZURE_CLIENT_SECRET=85831b42-0ab9-49cc-8082-8d0cc44a8f16
export AZURE_TENANT_ID=0e10ccd8-5b77-476f-af4c-13ff073b52f6

function switch_to_gcp()
{
    export PROJECT=padas-app
    export IAAS=gcp
    export ZONE=us-west1-a
    export CLUSTER_SPEC_FILE='deployment/cluster-specs/gcp.yaml'
} 

function switch_to_azure()
{
    export PROJECT=padas-app
    export IAAS=gcp
    export ZONE=eastus
    export CLUSTER_SPEC_FILE='deployment/cluster-specs/azure.yaml'
} 

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
