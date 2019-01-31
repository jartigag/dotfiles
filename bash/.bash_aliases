alias duh='du -h --max-depth=1'
alias gitlog='git log --graph --decorate --all'
function gitcl() { git clone $1 && cd $(basename $_ .git); }
function gitcm() { git add .; git commit -m "$1"; git push origin master; }
