set :repo_url, 'git@github.com:moonleerecords/moonlee-website.git'
set :repository, 'git@github.com:moonleerecords/moonlee-website.git'
set :application, 'moonlee-website'

# deploy from local
# set :repository, "."
# set :deploy_via, :copy

# Don't change these unless you know what you're doing
set :pty, true
set :use_sudo, false
set :stage, :production
set :deploy_via, :remote_cache

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w(config/application.yml)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets public/uploads)

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        # puts 'WARNING: HEAD is not the same as origin/master'
        # puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  before :starting, :check_revision
  after :finishing, :cleanup
  after :finishing, :restart
  after :updated, 'assets:precompile'
end

namespace :assets do
  desc 'Precompile assets locally and then rsync to web servers'
  task :precompile do
    on roles(:web) do
      rsync_host = host.to_s
      run_locally do
        with rails_env: fetch(:stage) do
          execute :bundle, 'exec rails assets:precompile'
        end
        execute "rsync -av --delete ./public/assets/ #{fetch(:user)}@#{rsync_host}:#{shared_path}/public/assets/"
        execute 'rm -rf public/assets'
      end
    end
  end
end
