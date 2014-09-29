#!/bin/bash -ex

# Clear previous build files
rm -rf boilerplate-master master.zip

sudo apt-get -y -q install ruby1.9.1 ruby1.9.1-dev
sudo gem i bundle
wget https://github.com/topaz2/boilerplate/archive/master.zip
unzip master.zip
cd boilerplate-master

if [ "$ENVIRONMENT" = "development" ]
then
  bundle update
  berks update
else
  bundle install --full-index --jobs=`ohai cpu/total` --without development
  berks install -e development
fi

vagrant plugin install vagrant-berkshelf --plugin-version '2.0.1'
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-omnibus
vagrant destroy --force
