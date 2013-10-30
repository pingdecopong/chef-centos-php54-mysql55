#
# Cookbook Name:: mysql55
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-libs" do
 action :remove
end

package "mysql55-server" do
 action :install
end

service "mysqld" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

bash "mysql_role" do
  code <<-"EOH"
    mysql -u root -e "grant all privileges on *.* to root@'%' identified by '' with grant option;"
    mysql -u root -e "flush privileges;"
  EOH
  action :run
end
