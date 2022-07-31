# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

brew tap homebrew/cask

# install utils
brew install wget
brew install telnet
brew install stern
brew install direnv
brew install romkatv/powerlevel10k/powerlevel10k

# install cloud utils
brew install awscli
brew install terraform
brew install google-cloud-sdk --cask

# install local dev
brew install virtualbox --cask
brew instal minikube --cask
brew install hyperkit
brew install txn2/tap/kubefwd
brew install golang-migrate
brew install prototool
brew install helm
brew install mysql

# set up local js dev 
brew install npm
brew install yarn
npm install -g js-beautify
npm install -g npm

# install mobile dev
npm install -g expo-cli
brew install watchman

# install serverless dev
npm install -g serverless

brew install php
brew install php-cli
brew install composer

brew install flyctl

