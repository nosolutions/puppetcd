Vagrant.configure("2") do |config|

  config.vm.define "railsdev" do |dev|
    dev.vm.box = 'puppetlabs/centos-7.0-64-puppet'
    dev.vm.hostname = 'puppetcd'
    dev.vm.network "forwarded_port", guest: 80,   host: 8080
    dev.vm.network "forwarded_port", guest: 443,  host: 8443
    dev.vm.network "forwarded_port", guest: 3000, host: 3000

    dev.vm.provision :puppet do |puppet|
      puppet.manifest_file  = "init.pp"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
    end
  end
end
