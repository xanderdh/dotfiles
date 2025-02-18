#/bin/zsh

alias cc='clear'
alias python=python3
alias pip=pip3
alias vim=nvim

#test zsh response time
alias zsh-test='for i in $(seq 1 5); do /usr/bin/time /bin/zsh -i -c exit; done'
