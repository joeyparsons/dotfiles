/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install wget
brew install telnet

# install command line cloud utils
# kubectl 1.15.3
# see other version installs at: https://gist.github.com/rdump/b79a63084b47f99a41514432132bd408#example-install-commands
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/7ee32113351bbd913b90f9578bcd52dfe85d675e/Formula/kubernetes-cli.rb

brew tap weaveworks/tap
brew install eksctl 
brew install awscli

# install set up for local k8s
brew cask install virtualbox
brew cask minikube
brew install hyperkit
brew install txn2/tap/kubefwd

brew install golang-migrate
brew install prototool

brew install terraform

# set up local js dev 
brew install npm
npm install -g js-beautify
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
command -v nvm
nvm install 12.11.1
nvm alias default 12.11.1
nvm use default

npm install -g npm

npm install -g expo-cli
brew install watchman


