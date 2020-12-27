ZSH_THEME="linuxonly"

plugins=(git colored-man-pages)
export LANG=en_US.UTF-8
export EDITOR='vim'

alias docker_psql='docker run -it --rm --link docker-postgres:postgres postgres:10.5 psql -h postgres -U postgres'
alias clickhouse_client='docker run -it --rm --link docker-clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server'
alias sshcode='~/go/bin/sshcode'
alias mosmetroconnect='python -m mosmetro'

