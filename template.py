
import random
import string
{{ skeleton.header_section }}

	def build(self, shutit):
		module_name = '{{ skeleton.module_name }}_' + ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(6))
		shutit.send('rm -rf /tmp/' + module_name + ' && mkdir -p /tmp/' + module_name + ' && cd /tmp/' + module_name)
		shutit.send_host_file('Vagrantfile','Vagrantfile')
		shutit.send('vagrant up --provider virtualbox',timeout=99999)
		shutit.login(command='vagrant ssh leader')
		shutit.login(command='sudo su -',password='vagrant')

{{ skeleton.build_section }}

		shutit.logout()
		shutit.logout()
		return True

	def get_config(self, shutit):
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

