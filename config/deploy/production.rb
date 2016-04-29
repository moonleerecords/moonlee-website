set :user, 'deploy'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :ssh_options, forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)

set :bower_bin, "/home/#{fetch(:user)}/apps/#{fetch(:application)}/current/node_modules/bower/bin/bower"

server '46.101.101.140', port: 22, roles: [:web, :app, :db], primary: true
