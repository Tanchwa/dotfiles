if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# PS1 Custom Config
# set current Git branch do display in prompt


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if KUBECONTEXT_ON=1;
then
        # set current kubernetes context to display in prompt
        parse_context() {
            KUBE_CONTEXT="$(kubectl config current-context 2> /dev/null)"
            KUBE_CONTEXT="${KUBE_CONTEXT:-N/A}"
            echo $KUBE_CONTEXT
        }
        parse_namespace() {
            KUBE_NAMESPACE="$(kubectl config view --minify -o 'jsonpath={..namespace}' 2> /dev/null)"
            KUBE_NAMESPACE="${KUBE_NAMESPACE:-default}"
            echo $KUBE_NAMESPACE
        }
        KUBE_PS1_SYMBOL=$'\u2388\ufe0f'
        KUBE_PS1_SYMBOL2=$'\u2638\ufe0f'
fi



export PS1="\[\033[32m\]\u@\h:\[\033[34m\]\w\[\033[33m\]\$(parse_git_branch) \[\033[00m\](\[\033[95m\]\$KUBE_PS1_SYMBOL2|\[\033[94m\]\$(parse_context)\[\033[00m\]:\[\033[95m\]\$(parse_namespace)\[\033[00m\])$ "
