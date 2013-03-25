#!/usr/bin/env ruby

# 朝阳 海淀 东城 西城 崇文 宣武 丰台 石景山 昌平 通州，其他

areas = %w(朝阳 海淀 东城 西城 崇文 宣武 丰台 石景山 昌平 通州)

Place.destroy_all
areas.each do |area|
  begin
    attr = { provice: "北京市",city: "北京市",area: area }
    place = Place.new(attr)
    place.save(false)    
    p area
  rescue =>e
    p e.message
  end  
end