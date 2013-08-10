set :application, "chrisalley"

role :web, "web412.webfaction.com"                          # Your HTTP server, Apache/etc
role :app, "web412.webfaction.com"                          # This may be the same as your `Web` server
role :db,  "web412.webfaction.com", :primary => true        # This is where Rails migrations will run

set :user, "chrisalley"
set :deploy_to, "/home/chrisalley/webapps/chrisalley"
set :use_sudo, false
default_run_options[:pty] = true

set :scm, "git"
set :repository,  "https://uriptical@github.com/uriptical/chris-alley.git"
set :branch, "master"

namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end

  desc "Symlink extra configs and folders."
  task :symlink_extras do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end

  desc "Setup shared directory."
  task :setup_shared_directory do
    run "mkdir #{shared_path}/assets"
    run "mkdir #{shared_path}/config"
    put File.read("config/examples/database.yml"), "#{shared_path}/config/database.yml"
    put File.read("config/examples/application.yml"), "#{shared_path}/config/application.yml"
  end
  
  namespace :assets do
    desc "Precompile assets on local machine and upload them to the server."
    task :precompile, roles: :web, except: {no_release: true} do
      run_locally "bundle exec rake assets:precompile RAILS_ENV=development"
      find_servers_for_task(current_task).each do |server|
        run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{server.host}:#{shared_path}/"
      end
    end
  end
end

after "deploy", "deploy:cleanup" # Keeps only the last 5 releases
after "deploy:setup", "deploy:setup_shared_directory"
after "deploy:update_code", "deploy:symlink_extras"
