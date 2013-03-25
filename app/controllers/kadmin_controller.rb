#coding:utf-8
class KadminController < ApplicationController
  skip_before_filter :prepare_data
  before_filter :root_required

private
  def root_required
    if current_user.nil? || current_user.role != User::ROOT
      go_home('请确认您的权限是否足够') and return
    end
    return true
  end
end
