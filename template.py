import random
import string

{{ skeleton.header_section }}

	def build(self, shutit):
		vagrant_image = shutit.cfg[self.module_id]['vagrant_image']
		vagrant_provider = shutit.cfg[self.module_id]['vagrant_provider']
		gui = shutit.cfg[self.module_id]['gui']
		memory = shutit.cfg[self.module_id]['memory']
		module_name = '{{ skeleton.module_name }}_' + ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(6))
		shutit.send('rm -rf /tmp/' + module_name + ' && mkdir -p /tmp/' + module_name + ' && cd /tmp/' + module_name)
		shutit.send('vagrant init ' + vagrant_image)
		shutit.send_file('/tmp/' + module_name + '/Vagrantfile','''
Vagrant.configure(2) do |config|
  config.vm.box = "''' + vagrant_image + '''"
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = ''' + gui + '''
    vb.memory = "''' + memory + '''"
    vb.name = "{{ skeleton.module_name }}"
  end
end''')
		shutit.send('vagrant up --provider virtualbox',timeout=99999)
		shutit.login(command='vagrant ssh')
		shutit.login(command='sudo su -',password='vagrant')

{{ skeleton.build_section }}

		shutit.logout()
		shutit.logout()
		return True

	def get_config(self, shutit):
		shutit.get_config(self.module_id,'vagrant_image',default='ubuntu/trusty64')
		shutit.get_config(self.module_id,'vagrant_provider',default='virtualbox')
		shutit.get_config(self.module_id,'gui',default='false')
		shutit.get_config(self.module_id,'memory',default='1024')
{{ skeleton.config_section }}
		return True

	def test(self, shutit):
{{ skeleton.test_section }}
		return True

	def finalize(self, shutit):
{{ skeleton.finalize_section }}
		return True

	def isinstalled(self, shutit):
{{ skeleton.isinstalled_section }}
		return False

	def start(self, shutit):
{{ skeleton.start_section }}
		return True

	def stop(self, shutit):
{{ skeleton.stop_section }}
		return True

def module():
	return {{ skeleton.module_name }}(
		'{{ skeleton.domain }}.{{ skeleton.module_name }}', {{ skeleton.domain_hash }}.0001,
		description='',
		maintainer='',
		delivery_methods=['bash'],
		depends=['{{ skeleton.depends }}','shutit-library.virtualbox.virtualbox.virtualbox','tk.shutit.vagrant.vagrant.vagrant']
	)



