class Kadmin::ChatsController < KadminController
  layout "kadmin"

  def index
    @chats = Chat.all
  end

  def check
    if Chat.exists?(:viewed=>nil)
      items = Chat.where(:viewed=>nil).collect { |c| { href: "http://chat.365weiyi.com/chat/#{Tiny::tiny(c.id)}?fr=admin" } }
      render :json => { status: 'ok',items: items }
    else
      render :nothing => true
    end
  end

end
