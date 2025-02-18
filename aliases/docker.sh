#/bin/zsh

#alias docker_cc="docker stop \$(docker ps -a -q) && docker rm \$(docker ps -a -q)"
alias docker_cc="docker ps -a -q | xargs docker stop | xargs docker rm"