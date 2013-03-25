#coding:utf-8
class AddColumnChatsViewed < ActiveRecord::Migration
  def self.up
    add_column :chats , :viewed, :boolean # 管理元 是否打开过该聊天室
  end

  def self.down
  end
end
