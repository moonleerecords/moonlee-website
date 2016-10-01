set :repo_url, 'git@github.com:moonleerecords/moonlee-website.git'
set :application, 'moonlee-website'
set :puma_threads, [1, 6]
set :puma_workers, 1

# deploy from local
# set :repository, "."
# set :deploy_via, :copy

# Don't change these unless you know what you're doing
set :pty, true
set :use_sudo, false
set :stage, :production
set :deploy_via, :remote_cache
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to false when not using ActiveRecord

set :jspm_build_flags, '--minify --skip-source-maps'

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w(config/application.yml)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets)

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

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

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting, :check_revision
  after :finishing, :cleanup
  after :finishing, :restart
  after :updated, 'assets:precompile'
  after :updated, 'jspm:build' do
    invoke 'jspm:build',
           'javascripts/records/app.js',
           'public/assets/javascripts/records/app.min.js'
    Rake::Task['jspm:build'].reenable
    invoke 'jspm:build',
           'javascripts/booking/app.js',
           'public/assets/javascripts/booking/app.min.js'
  end
end

namespace :assets do
  desc 'Precompile assets locally and then rsync to web servers'
  task :precompile do
    on roles(:web) do
      rsync_host = host.to_s
      run_locally do
        with rails_env: fetch(:stage) do
          execute :bundle, 'exec rake assets:precompile'
        end
        execute "rsync -av --delete ./public/assets/ #{fetch(:user)}@#{rsync_host}:#{shared_path}/public/assets/"
        execute 'rm -rf public/assets'
      end
    end
  end
end
