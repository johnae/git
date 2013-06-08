#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2013, Trice Imaging Inc.
#
# All rights reserved - Do Not Redistribute
#

package "git"

email = node[:git][:email]
name = node[:git][:name]

execute "root_git_email" do
  command "git config --global user.email \"#{email}\""
end

execute "root_git_name" do
  command "git config --global user.name \"#{name}\""
end

execute "vagrant_git_email" do
  user "vagrant"
  environment ({"HOME" => "/home/vagrant"})
  command "git config --global user.email \"#{email}\""
end

execute "vagrant_git_name" do
  user "vagrant"
  environment ({"HOME" => "/home/vagrant"})
  command "git config --global user.name \"#{name}\""
end

## workaround for bug in chef/git whatever
file "/root/.gitconfig" do
  mode "0755"
end