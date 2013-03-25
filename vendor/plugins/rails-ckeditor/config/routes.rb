#coding:utf-8
Inono::Application.routes.draw do |map|
  match 'ckeditor/images', :controller => 'ckeditor', :action => 'images'
  match 'ckeditor/files',  :controller => 'ckeditor', :action => 'files'
  match 'ckeditor/create/:kind', :controller => 'ckeditor', :action => 'create'
end
