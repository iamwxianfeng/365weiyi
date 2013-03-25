#coding:utf-8
module InquiriesHelper
  # For email address "kkmore@gmail.com", shows "k***@gmail.com"
  def show_abridged_email(email)
    email.sub(/^\w*/, email[0].chr + '***')
  end
end
