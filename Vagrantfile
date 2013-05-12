APP_HOSTNAME = 'virtual'

# Vagrant 2.0.x
Vagrant.configure("2") do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Set hostname
    config.vm.hostname = APP_HOSTNAME

    config.vm.network :forwarded_port, host: 8000, guest: 80

    # Share folders
    config.vm.synced_folder "..", "/vagrant", :nfs => true

    # Configure provider
    config.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--name", APP_HOSTNAME]
    end

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
