require 'serverspec'

set :backend, :ssh

options = Net::SSH::Config.for(host)
options[:host_name] = ENV['KITCHEN_HOSTNAME']
options[:user]      = ENV['KITCHEN_USERNAME'] || 'ec2-user'
options[:port]      = ENV['KITCHEN_PORT']
options[:keys]      = File.expand_path(File.join('~/.ssh', ENV['AWS_SSH_KEY_ID'] + '.pem'))

set :host, options[:host_name]
set :ssh_options, options
set :env, :LANG => 'C', :LC_ALL => 'C'
