Vagrant.require_plugin("vagrant-berkshelf")

Vagrant.configure("2") do |config|
  config.vm.hostname       = "designate-cookbook"
  config.berkshelf.enabled = true

  config.vm.box            = "precise64"
  config.vm.box_url        = "http://files.vagrantup.com/precise64.box"
  config.vm.network        :forwarded_port, guest: 9001, host: 9002
  config.vm.network        :private_network, ip: "192.168.50.1"
  config.ssh.max_tries     = 40
  config.ssh.timeout       = 120

  config.vm.provider :virtualbox do |vbox|
    # Enable the VBox GUI
    vbox.gui = true if ENV['VAGRANT_GUI']
  end

  config.vm.provider :lxc do |lxc|
    # Set the max RAM usage to 512 MB
    lxc.customize 'cgroup.memory.limit_in_bytes', '512M'
  end

  # Install the correct version of chef
  config.vm.provision :shell do |shell|
    shell.inline = %Q{
      if [ ! -f "/usr/bin/chef-solo" ]; then
        wget -O /tmp/chef.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/11.04/x86_64/chef_10.24.4-1.ubuntu.11.04_amd64.deb &&
        dpkg -i /tmp/chef.deb
      fi
    }
  end

  # Provision the VM with chef-solo
  config.vm.provision :chef_solo do |chef|
    chef.log_level       = :debug

    # Set some chef paths
    #chef.data_bags_path  = "data_bags"
    #chef.roles_path      = "roles"

    # Set the chef run-list
    chef.add_recipe("apt")
    chef.add_recipe("rabbitmq")
    chef.add_recipe("designate::database_migrate")
    chef.add_recipe("designate::central")
    chef.add_recipe("designate::agent")
    chef.add_recipe("designate::sink")
    chef.add_recipe("designate::api")
    
    # Provide some chef attributes
    chef.json = {
      :designate => {
        :rabbitmq_hosts => ['127.0.0.1:5672']
      },
      :rabbitmq => {
        :use_distro_version => true
      }
    }
  end

  config.vm.provision :shell do |shell|
    shell.inline = %Q{
      echo "Success!"
      echo ""
      echo "Now try configuring a nameserver address:"
      echo "curl -X POST -H \\"Content-Type: application/json\\" http://127.0.0.1:9002/v1/servers -d '{\\"name\\": \\"ns1.example.com.\\"}'"
      echo ""
      echo "Then, a domain:"
      echo "curl -X POST -H \\"Content-Type: application/json\\" http://127.0.0.1:9002/v1/domains -d '{\\"name\\": \\"example.org.\\", \\"email\\": \\"john@example.org\\"}'"
      echo ""
      echo "Then, a domain: (replace <domain-id>!)"
      echo "curl -X POST -H \\"Content-Type: application/json\\" http://127.0.0.1:9002/v1/domains/<domain-id>/records -d '{\\"name\\": \\"www.example.org.\\", \\"type\\": \\"A\\", \\"data\\": \\"127.0.0.1\\"}'"
    }
  end
end
