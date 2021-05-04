#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# update, upgrade and cleanup brew
brew update; brew upgrade; brew cleanup

BREW_PREFIX=$(brew --prefix)

brew install fish

if ! fgrep -q "${BREW_PREFIX}/bin/fish" /etc/shells
then
    echo "Setting fish as default shell."
    echo "${BREW_PREFIX}/bin/fish" | sudo tee -a /etc/shells
    chsh -s "${BREW_PREFIX}/bin/fish"
fi

brew install gnu-sed
brew install grep
brew install tree
brew install openssh ssh-copy-id
brew install xz p7zip pigz pbzip2
brew install openssl
brew install gdbm
brew install git

brew install --cask homebrew/cask-fonts/font-fira-code-nerd-font

brew cleanup