#
# Cookbook Name:: pry_me_out
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

log "In the default recipe"

binding.remote_pry

ruby_block "uh-oh" do
  block do
    ip = node['ipaddress']
    binding.remote_pry
  end
end

log "Logging stuff on the way out"
