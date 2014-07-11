script "install_plugin_bigdesk" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
  	plugin -install lukas-vlcek/bigdesk
  	EOH
	not_if { File.exist?("#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/plugins/bigdesk") }
end

#notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]
