class monit::common {
	package {"monit": ensure => installed }
	file {"/etc/monit.conf": 
		content => template("monit/monit.conf"),
		require => Package["monit"],
		before  => Service["monit"],
		mode    => 400,
		owner   => root,
		notify  => Service["monit"],
	}
	file { "/etc/monit.d":
		ensure => directory,
		mode   => 644,
		owner  => root,
		group  => root,
		before => Service["monit"]
	}
	service {"monit":
    require   => Package["monit"],
		ensure    => running,
		enable    => true,
		hasstatus => true,
	}
}
