Vagrant.require_plugin("berkshelf-vagrant")

Vagrant.configure("2") do |config|
  config.vm.hostname   = "moniker"
  # It seems the Ubuntu provided boxes don't work -_-
  #config.vm.box        = "precise-server-cloudimg-vagrant-amd64-disk1"
  #config.vm.box_url    = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"
  config.vm.box        = "precise64"
  config.vm.box_url    = "http://files.vagrantup.com/precise64.box"
  config.vm.network    :private_network, ip: "192.168.50.1"
  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provider :virtualbox do |vbox|
    # Enable the VBox GUI
    vbox.gui = true if ENV['VAGRANT_GUI']
  end

  # Install the correct version of chef
  # config.vm.provision :shell do |shell|
  #   shell.inline = %Q{
  #     if [ ! -f "/usr/bin/chef-solo" ]; then
  #       echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list &&
  #       wget -O - http://apt.opscode.com/packages@opscode.com.gpg.key | sudo apt-key add - &&
  #       sudo apt-get update &&
  #       sudo apt-get install chef --yes 
  #     fi
  #   }
  # end

  # Provision the VM with chef-solo
  config.vm.provision :chef_solo do |chef|
    chef.log_level       = :debug

    # Set some chef paths
    #chef.data_bags_path  = "data_bags"
    #chef.roles_path      = "roles"

    # Set the chef run-list
    chef.add_recipe("apt")
    chef.add_recipe("rabbitmq")
    chef.add_recipe("mysql::server")
    chef.add_recipe("moniker::central")
    chef.add_recipe("moniker::agent")
    chef.add_recipe("moniker::sink")
    chef.add_recipe("moniker::api")
    
    # Provide some chef attributes
    chef.json = {
      :moniker => {
        :DEFAULT => {
          :rabbit_hosts => ['127.0.0.1:5672']
        }
      },
      :rabbitmq => {
        :use_distro_version => true
      },
      :mysql => {
        :server_root_password => "server_root_password",
        :server_repl_password => "server_repl_password",
        :server_debian_password => "server_debian_password"
      }
    }
  end
end