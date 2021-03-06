#coding:utf-8
set :application, "365weiyi"
set :deploy_to, "/data/projects/365weiyi"

set :scm, "git"
set :repository,  "git@github.com:iamwxianfeng/365weiyi.git"
set :branch, "master"
# set :deploy_via, "remote_cache"
set :use_sudo, false
set :copy_strategy, :export
set :copy_via, :scp

set :user, "admin"

# Aliyun
server "112.126.70.25", :web, :app, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Creating database.yml"
  task :create_database_config do
    run "ln -s #{shared_path}/config/database.yml #{current_path}/config/database.yml"
    run "ln -s #{shared_path}/config/mail.yml #{current_path}/config/mail.yml"
    run "ln -nfs #{shared_path}/log #{current_path}/log"
    run "ln -nfs #{shared_path}/public/images/upload #{current_path}/public/images/upload"
    run "ln -nfs #{shared_path}/public/ckeditor_assets #{current_path}/public/ckeditor_assets"
    run "ln -nfs #{shared_path}/public/system #{current_path}/public/system"
  end

  desc "Restarting passenger"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:symlink", "deploy:create_database_config"
