#coding:utf-8
set :application, "inono"
set :deploy_to, "/var/www/zsites/dooxoo_www/dooxoowww"

set :scm, "git"
set :repository,  "git@inono.unfuddle.com:inono/inono.git"
set :branch, "master"
# set :deploy_via, "remote_cache"
set :use_sudo, false

set :user, "wangxf"
# ssh_options[:forward_agent] = true 添加上可能会出现 fatal: The remote end hung up unexpectedly 错误

server "www.365weiyi.com", :web, :app, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Creating database.yml"
  task :create_database_config do
    run "ln -s #{shared_path}/config/database.yml #{current_path}/config/database.yml"
    run "ln -s #{shared_path}/upload #{current_path}/public/images/upload"
    run "ln -s #{shared_path}/ckeditor_assets #{current_path}/public/ckeditor_assets"
  end

  desc "Restarting passenger"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:symlink", "deploy:create_database_config"
