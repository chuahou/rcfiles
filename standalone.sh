#!/bin/sh
#
# Usage:
#
#    sh install.sh
#
# Environment variables: VERBOSE, CP, LN, MKDIR, RM, DIRNAME.
#
#    env VERBOSE=1 sh install.sh
#
# DO NOT EDIT THIS FILE
# 
# This file is generated by rcm(7) as:
#
#   rcup -t none -g
#
# To update it, re-run the above command.
#
: ${VERBOSE:=0}
: ${CP:=/bin/cp}
: ${LN:=/bin/ln}
: ${MKDIR:=/bin/mkdir}
: ${RM:=/bin/rm}
: ${DIRNAME:=/usr/bin/dirname}
verbose() {
  if [ "$VERBOSE" -gt 0 ]; then
    echo "$@"
  fi
}
handle_file_cp() {
  if [ -e "$2" ]; then
    printf "%s " "overwrite $2? [yN]"
    read overwrite
    case "$overwrite" in
      y)
        $RM -rf "$2"
        ;;
      *)
        echo "skipping $2"
        return
        ;;
    esac
  fi
  verbose "'$1' -> '$2'"
  $MKDIR -p "$($DIRNAME "$2")"
  $CP -R "$1" "$2"
}
handle_file_ln() {
  if [ -e "$2" ]; then
    printf "%s " "overwrite $2? [yN]"
    read overwrite
    case "$overwrite" in
      y)
        $RM -rf "$2"
        ;;
      *)
        echo "skipping $2"
        return
        ;;
    esac
  fi
  verbose "'$1' -> '$2'"
  $MKDIR -p "$($DIRNAME "$2")"
  $LN -sf "$1" "$2"
}
handle_file_ln "$(realpath $(dirname $0))/bash_aliases" "$HOME/.bash_aliases"
handle_file_ln "$(realpath $(dirname $0))/config/git/config" "$HOME/.config/git/config"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/after/ftplugin/cabal.vim" "$HOME/.config/nvim/after/ftplugin/cabal.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/after/ftplugin/haskell.vim" "$HOME/.config/nvim/after/ftplugin/haskell.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/after/ftplugin/nix.vim" "$HOME/.config/nvim/after/ftplugin/nix.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/after/ftplugin/rst.vim" "$HOME/.config/nvim/after/ftplugin/rst.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/after/ftplugin/rust.vim" "$HOME/.config/nvim/after/ftplugin/rust.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/after/syntax/tex/listings.vim" "$HOME/.config/nvim/after/syntax/tex/listings.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/colors/thewursttheme.vim" "$HOME/.config/nvim/colors/thewursttheme.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/ftplugin/rst_header.vim" "$HOME/.config/nvim/ftplugin/rst_header.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/plugin/appearance.vim" "$HOME/.config/nvim/plugin/appearance.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/plugin/common.vim" "$HOME/.config/nvim/plugin/common.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/plugin/control.vim" "$HOME/.config/nvim/plugin/control.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/plugin/spdx.vim" "$HOME/.config/nvim/plugin/spdx.vim"
handle_file_ln "$(realpath $(dirname $0))/config/nvim/plugin/vimcompat.vim" "$HOME/.config/nvim/plugin/vimcompat.vim"
handle_file_ln "$(realpath $(dirname $0))/config/path.list" "$HOME/.config/path.list"
handle_file_ln "$(realpath $(dirname $0))/config/user-dirs.dirs" "$HOME/.config/user-dirs.dirs"
handle_file_ln "$(realpath $(dirname $0))/emacs" "$HOME/.emacs"
handle_file_ln "$(realpath $(dirname $0))/ghci" "$HOME/.ghci"
handle_file_ln "$(realpath $(dirname $0))/local/share/texmacs-notes.desktop" "$HOME/.local/share/texmacs-notes.desktop"
handle_file_ln "$(realpath $(dirname $0))/profile" "$HOME/.profile"
handle_file_ln "$(realpath $(dirname $0))/quiltrc" "$HOME/.quiltrc"
handle_file_ln "$(realpath $(dirname $0))/rcrc" "$HOME/.rcrc"
handle_file_ln "$(realpath $(dirname $0))/vimrc" "$HOME/.vimrc"
