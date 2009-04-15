# this class includes the monit plugin for munin
class monit::munin {
	include monit::common
	include munin::common
	munin::plugin {"monit":
		ensure => "monit",
		config => "user root",
		require => File["/usr/share/munin/plugins/monit"],
	}
	file {"/usr/share/munin/plugins/monit":
		mode => 555, owner => root, group => root,
		source => "puppet://$servername/monit/push/usr/share/munin/plugins/monit",
		before => Service["munin-node"],
		require => Package["munin-node"]
	}
}

