Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "edgeDevice1"

  # set vm name
  config.vm.define :edgeDevice1 do |nothing|
  end

  config.vm.network "public_network", bridge: "eth0"
  
  # config.ssh.username = "ubuntu"
  # config.ssh.password = "f8cd1eda5bc831d57dc6e9af"
  # config.ssh.private_key_path = "~/Vagrant/Edge/vagrant_rsa"
  config.vm.provider :virtualbox do |vb|
    vb.name = "edgeDevice1"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    # Note that if you limit the VM this hard you will have to disable
    # OptimizeForPerformance in the Azure Edge Runtime settings
    vb.customize [
      "modifyvm", :id,
    #   "--cpuexecutioncap", "50",
      "--memory", "1024",
    ]
  end
  
  # Prevent TTY Errors (copied from laravel/homestead: "homestead.rb" file)... By default this is "bash -l".
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # run iot-edge provision scriot
  config.vm.provision :shell, :path => "bootstrap.sh"

  # fix iotedge service not starting
  config.vm.provision :shell, :run => "always", :inline => "sudo systemctl restart iotedge"
end
