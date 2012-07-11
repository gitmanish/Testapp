set :application, "testapp"
set :repository,  "git@github.com:gitmanish/Testapp.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "bitnami"
set :use_sudo,true
ssh_options[:forward_agent]=true
ssh_options[:keys] =["/Users/mjoshi/Documents/TSKey.pem"]

role :web, "ec2-204-236-241-49.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
role :app, "ec2-204-236-241-49.compute-1.amazonaws.com"                          # This may be the same as your `Web` server
role :db,  "ec2-204-236-241-49.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run
role :db,  "ec2-204-236-241-49.compute-1.amazonaws.com"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

set :deploy_to, "/home/bitnami/stack/apache2/htdocs"
