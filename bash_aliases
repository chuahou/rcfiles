DEV_DIR=$HOME/dev

# basic commands
alias ls="ls --group-directories-first --color=tty"
alias rm="rm -i"
alias q="exit"
alias wget="wget -c"

# enable aliases in sudo
alias sudo="sudo "

# make tree max depth 3 by default and exclude .git folder
alias tree="tree -L 3 -I .git"

# rcm
RCM_DIR=$DEV_DIR/kiwami/rcfiles
alias rcup="rcup -v"
alias rcd="cd $RCM_DIR"
alias rcg="git -C $RCM_DIR"
alias rcgg="git -C $RCM_DIR/.."
alias rcpush="rcg push && rcgg add rcfiles && rcgg commit -m 'rcfiles: update'"

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
alias add-remote="git remote add origin https://github.com/chuahou/$(basename $(realpath .))"

# vim
if $(command -v nvim > /dev/null); then
	alias vi="nvim" # use nvim if present
elif $(command -v vim > /dev/null); then
	alias vi="vim" # otherwise use vim if present
fi
alias e="vi"

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

# cpufreq-set loop functions
# CPU_COUNT calculated by https://stackoverflow.com/a/6481016/12372506

# cpufreq-set max freq to $1
function cpufreq-setmaxfreq()
{
	CPU_COUNT=$(grep -c ^processor /proc/cpuinfo)
	for (( i=0; i<$CPU_COUNT; i++ )); do
		sudo cpufreq-set -c "$i" -r -u "$1" || break # break loop if one fails
	done
}

# cpufreq-set governor to $1
function cpufreq-setgov()
{
	CPU_COUNT=$(grep -c ^processor /proc/cpuinfo)
	for (( i=0; i<$CPU_COUNT; i++ )); do
		sudo cpufreq-set -c "$i" -r -g "$1" || break # break loop if one fails
	done
}

# presets
alias cpufreq-highpower="cpufreq-setmaxfreq 4.5GHz && cpufreq-setgov performance"
alias cpufreq-quiet="cpufreq-setmaxfreq 2.4GHz && cpufreq-setgov powersave"
