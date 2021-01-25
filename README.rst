#######
rcfiles
#######

**Succeeded by** `NixOS configuration <https://github.com/chuahou/conf.nix>`_.

Contains my rcfiles / dotfiles, to be managed with `rcm
<https://github.com/thoughtbot/rcm>`_.

This repo is designed to be cloned as a **submodule** of the `kiwami
repo <https://github.com/chuahou/kiwami>`_. For example, it contains
softlinks to outside of this repo.

(But it can survive if we have no need for zsh-vim-mode.)

For setup::

	$ RCRC=./rcrc rcup

On systems with no rcm, the untagged base files may be symlinked using
``standalone.sh``.

The old dotfiles repo can be found `here
<https://github.com/chuahou/dotfiles-old>`_.
