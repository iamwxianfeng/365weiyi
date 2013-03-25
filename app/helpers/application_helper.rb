#coding:utf-8
module ApplicationHelper
  
  ##
  # obj => :user 
  #        @user
  def error_messages_for obj    
    html = ''
    obj = instance_variable_get("@#{obj}") if obj.is_a?(Symbol)
    if obj.errors.any?      
      html << %Q{<div class="errorExplanation">}
      html << %Q(<ul>)
      obj.errors.each { |attr,msg|
        html << %Q(<li>#{msg}</li>)
      }
      html << %Q{</ul>}
      html << %Q{</div>}
    end
    raw html
  end
  
  def title(tit)
    content_for(:title) { tit }
  end
  
  def render_flash_messages
    s = ''
    flash.each do |k,v|
      s << content_tag('p', v.is_a?(Array) ? raw(v.join("<br/>")) : v,:class => "flash_#{k}")
    end
    raw s
  end
  
  #which_to_show: 0=category listing photo, 1=product show photo
  def photo_url(product, which_to_show = 0)
    photos = product.photos.all(:limit => 2, 
      :order => 'popularity DESC, created_at ASC')
    if which_to_show == 0 && (! photos.empty?)
      return photos[which_to_show].url
    elsif photos.size == 2
      return photos[which_to_show].url
    else
      return '/images/no_photo.jpg'
    end
  end

  def photo_tag(product, which_to_show)
    '<img src="' + photo_url(product, which_to_show) + '" alt="' + product.name + '" />'
  end

  def show_time(time)
    time.strftime('%Y-%m-%d %H:%M')
  end

  def get_index_products(subcategory_id)
    Product.all(:conditions => ['subcategory_id=?', subcategory_id],
      :limit => 3)
  end

  # eg. discount_in_database = 1
  def show_discount(discount_in_database = 1)
    return '[无优惠]' if discount_in_database == 1

    (discount_in_database * 10).to_s + '折'
  end
  
  def reserve_times
    arr = []
    ts = %w(9:00 9:30 10:00 10:30 11:00 11:30 12:00 12:30 13:00 13:30 14:00 14:30 15:00 15:30 16:00 16:30 17:00 17:30 18:00)
    ts.each do |t|
      arr.push([t,t])
    end
    arr
  end

end
