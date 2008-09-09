require 'eycap/recipes'
# =============================================================================
# ENGINE YARD EXPRESS REQUIRED VARIABLES
# =============================================================================

# =============================================================================
# CHANGE THESE
# =============================================================================

# Once you have the IP of your Express image, put it in here
set :express_ip, "nomad-labs.dyndns.org"
#set :express_ip, "nomad-berlin.dyndns.org"
# If you don't have ssh keys set up, then put your express user's password here
# set :password, "secret"

#
# Make your choice of source code management here, dependent on which your 
# application is currently stored in
#
# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false

# ==============================================================================
# DEPLOYING USING GITHUB
# ==============================================================================
set :github_user, "sabman"
set :github_app, "farmers_census"
set :scm, :git
# # Replace this with your git repository name
set :repository,  "git@github.com:#{github_user}/#{github_app}.git"
# # Replace this with your git username
set :scm_user,    github_user 
set :scm_passphrase, "p@ssw0rd"

# # Leave this, as we deploy and run the applications on the VM image as 'express'
set :user,        'express'
# 
# # This is the branch you wish to deploy, by default we've set it to master,
# # however you might want to set it to 'stable' or some other branch you're using
# set :branch,      "master"
# # Deploy using an ssh agent.  On Mac OS X you may need to run:
# # or something similar, to add your key to the agent and run it
# #  ssh-agent; ssh-add ~/.ssh/id_dsa
#
# set :ssh_options, { :forward_agent => true }

set :sql_pass,         '77zxcvb77'
set :application,      'rails'
set :keep_releases,    5
set :monit_group,      'rails'
set :deploy_to,        '/data/rails'
set :runner,           'express'
set :express_database, 'rails_prod'
set :sql_user,         'express_db'
set :sql_host,         'localhost'

default_run_options[:pty] = true

# =============================================================================
# ROLES
# =============================================================================
# You can define any number of roles, each of which contains any number of
# machines. Roles might include such things as :web, or :app, or :db, defining
# what the purpose of each machine is. You can also specify options that can
# be used to single out a specific subset of boxes in a particular role, like
# :primary => true. 
task :express do
  role :web, "#{express_ip}"
  role :app, "#{express_ip}"
  role :db, "#{express_ip}", :primary => true
  set :rails_env, "express"
  set :environment_database, Proc.new { express_database }
end

# =============================================================================
# Any custom after tasks can go here.
# after "deploy:symlink_configs", "express_custom"
# task :express_custom, :roles => :app, :except => {:no_release => true, :no_symlink => true} do
#   run <<-CMD
#   CMD
# end
# =============================================================================

namespace(:mongrel) do
  task :restart, :roles => :app do
    run "sudo monit restart all -g rails"
  end
  
  task :start, :roles => :app do
    run "sudo monit start all -g rails"
  end
  
  task :stop, :roles => :app do
    run "sudo monit stop all -g rails"
  end
  
  task :kill, :roles => :app, :on_error => :continue do
    run "sudo pkill -9 mongrel_rails"
  end
end

namespace(:deploy) do  
  task :symlink_configs, :roles => :app, :except => { :no_symlink => true } do
    run <<-CMD
      cd #{release_path} &&
      ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml &&
      ln -nfs #{shared_path}/config/mongrel_cluster.yml #{release_path}/config/mongrel_cluster.yml &&
      ln -nfs #{shared_path}/config/environments/express.rb #{release_path}/config/environments/express.rb
    CMD
  end
  
  desc "Long deploy will throw up the maintenance.html page and run migrations 
        then it restarts and enables the site again."
  task :long do
    transaction do
      update_code
      web.disable
      symlink
      migrate
    end
  
    restart
    web.enable
  end

  desc "Restart the Mongrel processes on the app server by calling restart_mongrel_cluster."
  task :restart, :roles => :app do
    mongrel.restart
  end

  desc "Start the Mongrel processes on the app server by calling start_mongrel_cluster."
  task :spinner, :roles => :app do
    mongrel.start
  end
end

namespace(:db) do
  task :migrate, :roles => :app, :except => { :no_symlink => true } do
    run "rails_ENV=#{rails_env} rake db:migrate"
  end
end

# TASKS
# Don't change unless you know what you are doing!
after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
after "deploy:update_code","deploy:symlink_configs"
# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"
