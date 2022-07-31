# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# install utils
brew install wget
brew install telnet
brew install stern
brew install direnv

# install cloud utils
brew install awscli
brew install terraform

# install local dev
brew cask install virtualbox
brew cask minikube
brew install hyperkit
brew install txn2/tap/kubefwd
brew install golang-migrate
brew install prototool
brew install helm

# set up local js dev 
brew install npm
npm install -g js-beautify
npm install -g npm

# install mobile dev
npm install -g expo-cli
brew install watchman

# install serverless dev
npm install -g serverless


brew install yarn
brew install mysql-server
brew install mysql

brew tap homebrew/cask
brew cask install google-cloud-sdk

brew install php
brew install php-cli
brew install composer

brew install flyctl

