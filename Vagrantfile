# -*- mode: ruby -*-

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "toff63/consul-0.6.0"

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "server-1" do |server1|
      server1.vm.hostname = "server1"
      server1.vm.network "private_network", ip: "172.20.20.10"
      server1.vm.provision "shell", path: "server-1.sh"
  end

  [["server-2", "172.20.20.12"],["server-3", "172.20.20.13"]].each { |name, ip|
      config.vm.define name do |server|
         server.vm.hostname = name
         server.vm.network "private_network", ip: ip
         server.vm.provision "shell" do |s|
      	     s.path = "server.sh"
	     s.args = "#{ip} #{name}"
        end
     end
  }

  [["client-1", "172.20.20.11"],["client-2", "172.20.20.14"]].each { |name, ip|
      config.vm.define name do |client|
          client.vm.hostname = name
	  client.vm.network "private_network", ip: ip
	  client.vm.provision "shell" do |s|
	  	s.path = "client.sh"
		s.args = "#{ip} #{name}"
	  end
      end
  }
end


