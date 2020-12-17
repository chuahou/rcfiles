DEV_DIR=$HOME/dev

# basic commands
alias ls="ls --group-directories-first --color=tty"
alias rm="rm -i"
alias q="exit"
alias wget="wget -c"
open () {
	for i in "$@"; do xdg-open $i; done
}
alias o="open"

# enable aliases in sudo
alias sudo="sudo "

# edit as root
alias sudoe="EDITOR=nvim sudo -e"

# make tree max depth 3 by default and exclude .git folder
alias tree="tree -L 3 -I .git"

# rcm
RCM_DIR=$DEV_DIR/kiwami/rcfiles
alias rcup="rcup -v"
alias rcd="cd $RCM_DIR"
alias rcg="git -C $RCM_DIR"
alias rcgg="git -C $RCM_DIR/.."
alias rcpush="$RCM_DIR/gen_script.sh && rcg add standalone.sh && rcg commit -m 'standalone.sh: update'; rcg push && rcgg add rcfiles && rcgg commit -m 'rcfiles: update'"

# set lifetime by default to 10m for ssh-add
alias ssh-add="ssh-add -t 10m"

# fun
alias please="sudo"
alias fucking="sudo"
alias meow="echo meow"

# git
alias add="git add"
alias a="git add"
alias aa="git add ."
alias commit="git commit"
alias c="git commit"
alias cm="git commit -m"
alias fix="git commit --amend --no-edit"
alias amend="git commit --amend"
alias ca="git commit --amend"
alias d="git diff"
alias ds="git diff --staged"
alias s="git status"
alias status="git status"
alias push="git push"
alias p="git push"
alias pom="git push origin master"
alias pomf="git push origin master -f"
alias pomu="git push origin master -u"
alias pall="git push origin --all --tags"
alias pull="git pull"
alias prebase="git pull --rebase"
alias pr="git pull --rebase"
alias log="git log"
alias l="git log --oneline --decorate"
alias l1="l -n 1"
alias lshow="git log -n 1"

# git convert https GitHub remote URL to ssh
alias gh2ssh="git remote set-url origin \$(git remote get-url origin | sed 's/https:\/\/\(chuahou@\)\?github.com\/chuahou\/\([^\.]*\)\(\.git\)\?/git@github.com:chuahou\/\2/')"

# vim
if $(command -v nvim > /dev/null); then
	alias vi="nvim" # use nvim if present
elif $(command -v vim > /dev/null); then
	alias vi="vim" # otherwise use vim if present
fi
alias e="vi"

# emacs
alias emacs="emacs --color=16"
alias org="emacs ~/org/index.org"

# vimwiki shortcuts
alias wiki="e +VimwikiIndex"
alias wikimake="make -C $DEV_DIR/knowledge all"
alias wikipush="git -C $DEV_DIR/knowledge push origin master"
alias wikip="wikimake && wikipush"

# minimal vim
alias mvim="e -c 'set laststatus=0 | set cmdheight=1 | set foldcolumn=0 | set signcolumn=no | set nonumber | set norelativenumber | set nolist'"
alias plan="mvim ~/Plan.txt"

# check git script
alias cgit="check-git"

# disown by default when running some applications
_run_and_disown () {
	$@ & disown
}
_disown_progs=( zathura meld gitg nautilus xdg-open )
for prog in "${_disown_progs[@]}"; do
	alias $prog="_run_and_disown $prog"
done
