#!/usr/bin/env ruby

##
# 更新role字段含有中文情况
i = 0
User.find_each do |user|
  i += 1
  p "#{i} --- #{user.email}"
  r = case user.role
  when /受限/ then User::BLOCKED
  when /会员/ then User::USER
  when /员工/ then User::EDITOR
  when /管理员/ then User::ROOT
  when /量体师/ then User::RULER
  end
  unless r.nil?
    user.role = r
    user.save
  end
end