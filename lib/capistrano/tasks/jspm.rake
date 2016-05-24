namespace :jspm do
  desc 'jspm install'
  task :install do
    on roles fetch(:jspm_roles) do
      within "#{release_path}" do
        execute fetch(:jspm_bin), 'install'
      end
    end
  end

  before 'deploy:updated', 'jspm:install'

  desc 'bundle for production'
  task :bundle_sfx do |task, args|
    on roles fetch(:jspm_roles) do
      within "#{release_path}" do
        # TODO: jspm:bundle_sfx[javascripts/records/app.js,assets/javascripts/records/app.min.js]
        unless args.extras.count == 2
          puts 'Missing arguments'
          exit
        end

        execute fetch(:jspm_bin), 'bundle-sfx', fetch(:jspm_sfx_flags), args.extras.join(' ')
      end
      # jspm bundle-sfx --minify javascripts/records/app.js assets/javascripts/records/app.min.js
      # TODO: execute fetch(:bower_bin), "install", fetch(:bower_flags)
      # TODO: options (minify) -from, -to
    end
  end

  # TODO: bundle-sfx and other tasks
  # TODO: export this as gem
end

namespace :load do
  task :defaults do
    # TODO: write this to documentation
    set :jspm_roles, :web
    set :jspm_bin, :jspm
    set :jspm_sfx_flags, '--minify'
    # TODO: from_file, to_file as parameters
  end
end