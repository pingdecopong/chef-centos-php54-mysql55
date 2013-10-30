#
# Cookbook Name:: php54
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(php54 php54-cli php54-pdo php54-mbstring php54-mcrypt php54-pecl-memcache php54-mysql php54-devel php54-common php54-pgsql php54-pear php54-gd php54-xml php54-pecl-xdebug php54-pecl-apc php54-process php54-intl).each do |package|
  yum_package package do
    action :install
  end
end

template "php.ini" do
  path "/etc/php.ini"
  source "php.ini.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[httpd]'
end
