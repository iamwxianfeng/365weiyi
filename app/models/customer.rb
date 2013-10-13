#coding:utf-8
class Customer < ActiveRecord::Base

  module Style
    Thin = 1 # 瘦
    LittleThin =2 # 偏瘦
    Normail = 3 #　标准
    Strong = 4 # 强壮
    LittleFat = 5 # 偏胖
    Fat = 6 # 肥胖
  end

  module OtherStyle
    LiuJian = 1 # 溜肩
    DuanJian = 2 # 端肩
    GaoDiJian = 3 # 高低肩
    QiaoTuan = 4 # 翘臀
    TuoBei = 5 # 驼背
  end

  def self.style_select_value
    [
      ['瘦', Style::Thin],
      ['偏瘦', Style::LittleThin],
      ['标准', Style::Normail],
      ['强壮', Style::Strong],
      ['偏胖', Style::LittleFat],
      ['肥胖', Style::Fat]
    ]  
  end

  def self.other_style_value
    [
      ['溜肩', OtherStyle::LiuJian],
      ['端肩', OtherStyle::DuanJian],
      ['高低肩', OtherStyle::GaoDiJian],
      ['翘臀', OtherStyle::QiaoTuan],
      ['驼背', OtherStyle::TuoBei]
    ]
  end

  def human_style
    self.class.style_select_value.select { |_,v| v == self.style }.flatten[0]
  end

  def human_other_style
    self.class.other_style_value.select { |_,v| v == self.other_style }.flatten[0]
  end

end
