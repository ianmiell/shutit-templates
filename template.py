{{ skeleton.header_section }}

	def build(self, shutit):
{{ skeleton.build_section }}
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

{{ skeleton.final_section }}
