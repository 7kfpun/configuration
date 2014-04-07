APP_HOSTNAME = 'virtual1'
APP_HOST = '33.33.33.10'
APP_ROLES = ['controller', 'chef-server', 'gae']

# Config
NFS = true
VM_MEMORY = "3072"
VM_CPUS = "2"

# Vagrant 2.0.x
Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?('vagrant-cachier')
    puts 'INFO:  Vagrant-cachier plugin detected. Optimizing caches.'
    config.cache.auto_detect = true
  else
    puts 'WARN:  Vagrant-cachier plugin not detected. Continuing unoptimized.'
  end

  # Detects vagrant-omnibus plugin
  if Vagrant.has_plugin?('vagrant-omnibus')
    puts 'INFO:  Vagrant-omnibus plugin detected. Chef is the latest version.'
    config.omnibus.chef_version = :latest
  else
    puts "FATAL: Vagrant-omnibus plugin not detected. Please install the plugin with\n       'vagrant plugin install vagrant-omnibus' from any other directory\n       before continuing."
    exit
  end

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Set hostname
  config.vm.hostname = APP_HOSTNAME

  # Configure network
  config.vm.network :private_network, ip: APP_HOST

  # Share folders
  config.vm.synced_folder "..", "/workspace", :nfs => NFS

  # Configure provider
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", VM_MEMORY]
    vb.customize ["modifyvm", :id, "--cpus", VM_CPUS]
    vb.customize ["modifyvm", :id, "--name", APP_HOSTNAME]
  end

  config.omnibus.chef_version = :latest

  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = "roles"

    APP_ROLES.each do |role|
      chef.add_role role
    end
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  end

  # enable X11 forwarding over SSH connections
  config.ssh.forward_x11 = true
  config.ssh.forward_agent = true

end
