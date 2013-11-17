#coding: utf-8
class UserMailer < ActionMailer::Base

  default :from => "noreply@sqopen.com"

  def reserve(ruler)
    @ruler = ruler
    _to = YAML.load(IO.read("#{Rails.root}/config/mail.yml"))['receiver']
    _subject = "HEY, BOSS, 有客户 #{ruler.human_status}"
    mail(:to => _to ,:subject => _subject)
  end

end
