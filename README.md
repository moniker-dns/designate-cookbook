# Moniker cookbook

## Cookbook Development

Requirements:

1. Vagrant - http://www.vagrantup.com/
2. Virtualbox - https://www.virtualbox.org/
3. Berkshelf - http://berkshelf.com/
4. Vagrant Berkshelf plugin - https://github.com/riotgames/berkshelf-vagrant

Setup:

1. git clone git@github.com:moniker-dns/moniker-cookbook.git
2. rvm --rvmrc --create ruby@moniker-cookbook
3. gem install berkshelf
4. sudo vagrant plugin install berkshelf-vagrant

Process:

1. `vagrant up`
2. Code..
3. `vagrant provision`
4. Goto 2
