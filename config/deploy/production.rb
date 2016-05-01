set :user, 'deploy'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :ssh_options, forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"

server '46.101.101.140', port: 22, roles: [:web, :app, :db], primary: true
