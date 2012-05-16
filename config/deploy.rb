set :application, "hisrocket-wiki"
set :repository,  "git@github.com:eehah5ru/hisrocket-wiki.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/c/cl86444/wiki.hisrocket.org"



role :web, "MERCURIUS.timeweb.ru" 

#server "MERCURIUS.timeweb.ru", :web
set :user, "cl86444"
set :via, "scp"
set :use_sudo, false
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

task :after_update_code do
  %w{images serverSettings.php}.each do |share|
    run "ln -s #{shared_path}/#{share} #{release_path}/#{share}"
  end
  
=begin  
  %w{database.yml environment.rb}.each do |config|
    run "ln -nfs #{shared_path}/#{config} #{release_path}/config/#{config}"
  end
=end
end

#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"


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

namespace :deploy do
    task :start do
    end
    task :stop do
    end
    task :restart do
    end
    task :finalize_update do
    end
end