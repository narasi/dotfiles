# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
alias reload-profile='source /etc/profile && source ~/.zshrc && source ~/.bash_profile'
fortune
alias gsetproject='gcloud config set project'
alias g='gcloud'
alias gget='gcloud config list'
alias gsetcluster='gcloud container clusters get-credentials'
alias gsetzone='gcloud config set compute/zone'
alias kgetallpods='kubectl get pods -o wide --all-namespaces'
alias k='kubectl'
alias kgetall='kubectl get --all-namespaces'
alias gssh='gcloud compute ssh'
alias gscp='gcloud compute scp'
alias gce='gcloud compute'
alias uuid='curl https://www.uuidgenerator.net/api/version4'
kgetallresources() {
	kubectl get --all-namespaces $(kubectl api-resources --namespaced=true | awk 'NR>1' | awk '{printf "%s%s",sep,$1; sep=","} END{print ""}' ) 
}
