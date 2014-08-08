APP_HOSTNAME = 'virtual1'
APP_HOST = '33.33.33.10'
# APP_ROLES = ['pyhub']

# Config
NFS = true
VM_MEMORY = "2048"
VM_CPUS = "2"

# Vagrant 2.0.x
Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Set hostname
  config.vm.hostname = APP_HOSTNAME

  # Configure network
  config.vm.network :private_network, ip: APP_HOST
  # config.vm.network :public_network

  # Share folders
  config.vm.synced_folder "../..", "/workspace", :nfs => NFS

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = "vv"
  end

  config.ssh.forward_agent = true

end
