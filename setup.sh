#!/bin/bash

# bash 'strict mode'
set -euo pipefail
IFS=$'\n\t'

OMZ="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

# stow convenience function
_stow() {
  stow -t ~ $1
}

# main
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Check for Homebrew and install if we don't have it
    if test ! $(which brew); then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    brew update
    brew upgrade
    brew bundle
    BREW_PREFIX=$(brew --prefix)
    ln -sf "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
fi

# install oh-my-zsh and then remove the default .zshrc it provides, we will
# add our own.
[ ! -d $HOME/.oh-my-zsh ] && RUNZSH=no sh -c "$(curl -fsSL $OMZ)" && rm $HOME/.zshrc

for m in tmux zsh git vim; do
    _stow "$m"
done


# vim: set expandtab ts=2 sts=2 sw=2:
