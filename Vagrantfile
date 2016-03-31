# # -*- mode: ruby -*-
# vi: set ft=ruby :
number_of_nodes = ENV['NUMBER_OF_NODES'] || 3
number_of_followers = number_of_nodes.to_i - 1
raise 'The Cluster Lab needs at least 3 nodes to operate' if (number_of_nodes < 3)
Vagrant.configure(2) do |config|
  config.vm.network "private_network", type: "dhcp"
  config.vm.define "leader" do |leader|
    leader.vm.box = "ubuntu/wily64"
    leader.vm.hostname = 'leader'
  end
  (1..number_of_followers).each do |node_number|
    config.vm.define "follower#{node_number}" do |follower|
      follower.vm.box = "ubuntu/wily64"
      follower.vm.hostname = "follower#{node_number}"
    end
  end
  config.vm.synced_folder "..", "/cluster-src"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
  config.vm.provision "shell", keep_color: true, path: "setup_cluster_lab.sh"
end
