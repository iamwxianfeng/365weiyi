#!/usr/bin/env ruby

#  西服、衬衫、大衣、搭配、面料、工艺、潮流、工作服

%w(西服 衬衫 大衣 搭配 面料 工艺 潮流 工作服).each do |category|
    bc = BlogCategory.new
    bc.name = category
    bc.save
end