# source bashrc if running bash and it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# add directories to path if they exist
for DIR in \
	$HOME/.local/bin \
	$HOME/bin \
	$HOME/.cargo/bin \
	$HOME/.cabal/bin
do
	[ -d "$DIR" ] && PATH="$DIR:$PATH"
done

# set PS1
PS1="\$"
