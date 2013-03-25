#!/usr/bin/env ruby

email = "wangchao@365weiyi.com"

user = User.find_by_email(email)

unless user.nil?
  user.role = User::ROOT
  if user.save!
    p "SUCCESS!!!"
  else
    p "FAIL!!!"
  end
end