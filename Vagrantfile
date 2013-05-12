Vagrant::Config.run do |config|
  config.vm.define :vm do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Forward a port
    config.vm.forward_port 80, 8080
    config.vm.forward_port 8000, 8001

    # Share folders
    # config.vm.synced_folder "..", "/vagrant"  # , {:nfs => true}

    # Enable provisioning with chef solo, specifying a cookbooks path (relative
    # to this Vagrantfile), and adding some recipes and/or roles.
    #
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.add_role('main')
    #
    #   # You may also specify custom JSON attributes:
    #   chef.json = { :mysql_password => "foo" }
    end
  end
end
