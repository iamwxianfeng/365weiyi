#coding:utf-8
class Photo < ActiveRecord::Base
  belongs_to :product

  #photo display order
  COVER = 11
  MAIN = 10

  validates_presence_of :url, :message => '图片的URL不能为空'
  validates_format_of :url,
    :with => /^.*(.jpg|.JPG|.gif|.GIF|.png|.PNG|.jpeg|.JPEG)$/,
    :message => '只能上传jpg(jpeg),gif或png图片'

  attr_accessor :image

  def self.save_photo(image)
    directory = File.join('public', 'images', 'upload')
    Dir.mkdir(directory) unless File.directory?(directory)
    #generate timestamped filename
    filename = Time.now.to_i.to_s + '.' + File.basename(image.original_filename).split('.').last
    image_url = File.join(directory, filename)
    File.open(image_url, 'wb') {|f| f.write(image.read)}
    return "/images/upload/#{filename}"
  end

  #filename LIKE "/images/upload/2828282.png"
  def self.delete(filename)
    filename = 'public' + filename
    File.delete(filename) if File.exists?(filename)
  end
end
