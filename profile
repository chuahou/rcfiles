# source bashrc if running bash and it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# add directories to path if they exist
grep -v '^#' $HOME/.config/path.list | while read DIR; do
	[ -d "$HOME/$DIR" ] && PATH="$HOME/$DIR:$PATH"
done

# set PS1
PS1="\$"
