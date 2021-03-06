### gcloud
alias gcloud='~/google-cloud-sdk/bin/gcloud'

### Python
alias python='python3'

### Docker
alias d='docker'
alias drmall='docker rm -f $(docker ps -a -q)'
dbash(){ docker exec -it $(docker ps | tail -n +2 | fzf | awk '{print $1}') bash; }
dlogs(){ docker logs -f $(docker ps | tail -n +2 | fzf | awk '{print $1}'); }

### Kubernetes
kurl() {
  kubectl run kurl --rm --tty -i --restart='Never' --namespace $N --image curlimages/curl --command -- sh
}

kpsql() {
  kubectl run kpsql --rm --tty -i --restart='Never' --namespace $N --image bitnami/postgresql --command -- /bin/bash
}

### fzf

# h find previous commands in history and repeat it.
h() {
  local cmd
  cmd=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
  echo "run: $cmd\n"
  echo $cmd | pbcopy
  eval $cmd
}

# cph find previous commands in history and copy it.
cph(){
  echo $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g') | pbcopy
}
