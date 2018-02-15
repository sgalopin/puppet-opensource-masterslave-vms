node 'agent-pos.example.com' {
	class { 'rtm':
		vhost_servername => 'agent-pos.example.com',
		cookie_domain => '.example.com',
		admin_ip_address => '192.168.50.1',
		host_ip_address => '192.168.50.16',
		pg_user => 'postgres',
		pg_password => 'postgres',
	}
}