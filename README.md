# Designate cookbook

## Cookbook Development

Requirements:

1. Vagrant - http://www.vagrantup.com/
2. Virtualbox - https://www.virtualbox.org/
3. Berkshelf - http://berkshelf.com/
4. Vagrant Berkshelf plugin - https://github.com/riotgames/berkshelf-vagrant

Setup:

1. Install VirtualBox
2. Install Vagrant
3. git clone git@github.com:moniker-dns/moniker-cookbook.git
4. rvm --rvmrc --create ruby@moniker-cookbook (optional.. some people prefer RVM)
5. gem install berkshelf
6. vagrant plugin install berkshelf-vagrant

Process:

1. `vagrant up`
2. Code..
3. `vagrant provision`
4. Goto 2

The API will be available on http://127.0.0.1:9002/v1/
