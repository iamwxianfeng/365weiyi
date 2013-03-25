#coding:utf-8
namespace :db do
  desc "initialize database"
  task :add_data => :environment do

    suit = Category.create(
      {:name => '西 服', :popularity => 9, :logo => '/images/suit.gif', :url => 'suit'}
    )
    shirt = Category.create(
      {:name => '衬 衣', :popularity => 8, :logo => '/images/shirt.gif', :url => 'shirt'}
    )
    t_shirt = Category.create(
      {:name => '团队T恤', :popularity => 7, :logo => '/images/team.gif', :url => 'tshirt'}
    )

    Subcategory.create([
      {:name => '女式西服', :popularity => 9, :category_id => suit.id, :url => 'woman'},
      {:name => '男式西服', :popularity => 8, :category_id => suit.id, :url => 'man'}
    ])
    Subcategory.create([
      {:name => '女式衬衣', :popularity => 9, :category_id => shirt.id, :url => 'woman'},
      {:name => '男式衬衣', :popularity => 8, :category_id => shirt.id, :url => 'man'}
    ])
    Subcategory.create([
      {:name => '文化衫', :popularity => 9, :category_id => t_shirt.id, :url => 'tshirt'},
      {:name => 'POLO衫', :popularity => 8, :category_id => t_shirt.id, :url => 'polo'}
    ])



    puts 'adding products...'
    product1 = Product.new(
      {:name => '多秀绝版', :serial_number => '007', :origin=> 'usa', :component => '纯棉', :yarn => '0.5', :color => '橘红', :description => 'i am from china', :market_price => 178, :our_price => 120, :measure => '170:190:200', :availability => true, :subcategory_id => (Subcategory.all()[0]).id}
    )
    product1.photos.build([
      {:name => '正面图', :url => '/images/xifu.gif'},
      {:name => '侧面图', :url => '/images/dd.gif'}
    ])
    product1.save

    Product.create(
      {:name => '多秀绝版2', :serial_number => '007', :origin=> 'usa', :component => '纯棉', :yarn => '0.5', :color => '橘红', :description => 'i am from china', :market_price => 178, :our_price => 120, :measure => '170:190:200', :availability => true, :subcategory_id => (Subcategory.all()[0]).id}
    )

    product2 = Product.new(
      {:name => '哈工大恐龙专用', :serial_number => 'ISO9002', :origin=> 'Shandong', :component => '钻石', :yarn => '1.5', :color => 'ruby宝石红', :description => 'imported from Paris, France', :market_price => 200, :our_price => 150, :measure => '18/19:19/23', :availability => true, :subcategory_id => (Subcategory.all()[3]).id}
    )
    product2.photos.build([
      {:name => '倒着看', :url => '/images/xifu1.gif'},
      {:name => '翻过来', :url => '/images/xifu3.gif'}
    ])
    product2.save



    puts "adding companies..."
    company = User.create([
      {:email => 'me@tsinghua.edu.cn', :password => 'tsinghua', :password_confirmation => 'tsinghua'},
      {:email => 'dooxoo@dooxoo.com', :password => 'dooxoo', :password_confirmation => 'dooxoo'}
    ])
    company[0].is_company = true
    company[0].save
    company[1].is_company = true
    company[1].save
    
    Profile.create([
     {:name => '哈工大公司', :user_id => company[0].id},
     {:name => '多秀', :address => '五道口', :user_id => company[1].id}
    ])

    puts 'adding users...'
    user = User.create([
      {:email => 'kktest@kktest.com', :password => 'kktest', :password_confirmation => 'kktest'},
      {:email => 'root@root.com', :password => 'kkrootzhou', :password_confirmation => 'kkrootzhou'}
    ])
    user[1].role = '管理员'
    user[1].save

    Profile.create([
      {:name => '测试员', :address => '大韩民国', :zipcode => '402020', :website => 'www.g.cn', :institution => 'Seoul Natl. U.', :phone => '110', :user_id => user[0].id},
      {:name => 'Root of All Evil', :address => '山东', :zipcode => '202220', :website => 'www.dooxoo.cn', :institution => 'Tsinghua U', :phone => '220', :user_id => user[1].id}
    ])

    puts "adding notices and helps..."
    Notice.create([
    {:name => '新春大降价', :description => 'www.dooxoo.com/blog', :popularity => 3},
    {:name => 'big sale', :description => 'www.g.cn'}
    ])

    Help.create([
    {:name => 'about', :title => '关于我们', :description => ''},
    {:name => 'how', :title => '订购指南', :description => '
 1. 体验点试穿。请就近选择体验点试穿，挑选合适的号型和颜色，当场取衣或者由快递到您所指定地址。<br /><br />2. 直接网上订购，快递送达。建议购买过程中咨询在线客服。<br /><br />3. 北京客户，定做请直接来多秀海淀区五道口体验中心（清华东门附近华清商务会馆703A）。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#d40a00;font-size:16px;">Q Q：756742417&nbsp;&nbsp;&nbsp; 65311090</span><span style="color:#d40a00;font-size:16px;"><br /><br />&nbsp;&nbsp;&nbsp;&nbsp; MSN：dooxoo.cn@hotmail.com</span>
      
      
      '},
    {:name => 'company-process', :title => '企业定制流程', :description => '企业订制'},
    {:name => 'individual-process', :title => '个人定制流程', :description => '个人订制'},
    {:name => 'timeline', :title => '工期说明', :description => '工期说明'},
    {:name => 'service', :title => '售后服务', :description => '售后'},
    {:name => 'career', :title => '工作机会', :description => ''},
    {:name => 'contact', :title => '联系我们', :description => ''},

    {:name => 'beijing-store', :title => '北京体验店'},
    {:name => 'shanghai-store', :title => '上海体验店'}
    ])

    puts "adding comments and replies..."
    Comment.delete_all
    product = Product.find(:first)
    user = User.find(:first)
    comment1 = product.comments.build(:name => 'I love this game', :popularity => 3, :user_id => user.id, :approved => true)
    comment1.save

    comment2 = product.comments.build(:name => '我也觉得可以', :popularity => 1, :user_id => user.id, :approved => true)
    comment2.save

    Reply.delete_all
    Reply.create(:name => '谢谢您的关心！', :user_id => user.id, :comment_id => comment2.id)

    puts "adding banners..."
    Banner.create([
      {:name => 'first', :photo_url => '/images/flash_img.gif', :popularity => 5},
      {:name => 'promotion', :photo_url => '/images/right_gg1.gif', :can_scroll => false, :link_to => '/products/1'},
      {:name => 'another promotion', :photo_url => '/images/right_gg1.gif', :can_scroll => false, :link_to => '/products/2'}
    ])


=begin
    puts "adding measure categories..."
    measure = MeasureCategory.create([
      {:name => '西服上衣', :popularity => 9},
      {:name => '西服裤子', :popularity => 7},
      {:name => '衬衫', :popularity => 5}
    ])
=end

    puts "adding measure pages..."
    MeasurePage.create([
      {:name => '西服上衣', :favorite_brand => 'NIKE; Adidas; Rebok', :description => <<-'EOT'
		<h3>量体中心说明：</h3>
		<p><strong>1、</strong>以下是制作西服上衣需要的数据及量测方法，请自行或者在客服的指导下量测并完成提交。建议您在客服的指导下共同完成。</p>
		<p><strong>2、</strong>如果能提供一张全身正面、侧面、背面站立照（或其中之一）给我们，这对最后数据的确定非常有帮助。请与客服联系，提交照片（非必选项）。</p>
		<p><strong>3、</strong>如果能提供您平常穿着感觉最合适、舒服的其他品牌服饰的型号。比如穿雅戈尔的175B西服感觉合适，或者jackjones的休闲西服感觉舒服等等。这将有助于对您的身材特征及穿着偏好有更多的了解（非必选项）。</p>
		<p><strong>4、</strong>如无特别说明，您提交的所有尺寸均应为净尺寸，即将皮尺贴身量的尺寸。</p>
		<p><strong>5、</strong>以上2、3项均非必选项，可以不提交。</p>
		<h3>西服上衣尺寸图示</h3>
		<div class="xoh xb"><img src="/images/pic_jie.gif"></div>
EOT
      },
      {:name => '西服裤子', :favorite_brand => 'VANCL; Kudos; 劲霸', :description => <<-'EOT'
		<h3>量体中心说明：</h3>
		<p><strong>1、</strong>以下是制作西服裤子需要的数据及量测方法，请自行或者在客服的指导下量测并完成提交。建议您在客服的指导下共同完成。</p>
		<p><strong>2、</strong>如果能提供一张全身正面、侧面、背面站立照（或其中之一）给我们，这对最后数据的确定非常有帮助。请与客服联系，提交照片（非必选项）。</p>
		<p><strong>3、</strong>如果能提供您平常穿着感觉最合适、舒服的其他品牌服饰的型号。比如穿雅戈尔的175B西服感觉合适，或者jackjones的休闲西服感觉舒服等等。这将有助于对您的身材特征及穿着偏好有更多的了解（非必选项）。</p>
		<p><strong>4、</strong>如无特别说明，您提交的所有尺寸均应为净尺寸，即将皮尺贴身量的尺寸。</p>
		<p><strong>5、</strong>以上2、3项均非必选项，可以不提交。</p>
		<h3>西服裤子尺寸图示</h3>
		<div class="xoh xb"><img src="/images/pic_jie.gif"></div>
EOT
      },
      {:name => '衬衫', :favorite_brand => '中国衬衫', :description => <<-'EOT'
		<h3>量体中心说明：</h3>
		<p><strong>1、</strong>以下是制作衬衫需要的数据及量测方法，请自行或者在客服的指导下量测并完成提交。建议您在客服的指导下共同完成。</p>
		<p><strong>2、</strong>如果能提供一张全身正面、侧面、背面站立照（或其中之一）给我们，这对最后数据的确定非常有帮助。请与客服联系，提交照片（非必选项）。</p>
		<p><strong>3、</strong>如果能提供您平常穿着感觉最合适、舒服的其他品牌服饰的型号。比如穿雅戈尔的175B西服感觉合适，或者jackjones的休闲西服感觉舒服等等。这将有助于对您的身材特征及穿着偏好有更多的了解（非必选项）。</p>
		<p><strong>4、</strong>如无特别说明，您提交的所有尺寸均应为净尺寸，即将皮尺贴身量的尺寸。</p>
		<p><strong>5、</strong>以上2、3项均非必选项，可以不提交。</p>
		<h3>衬衫尺寸图示</h3>
		<div class="xoh xb"><img src="/images/pic_jie.gif"></div>
EOT
      }
    ])

    puts "adding measure properties..."
    measure_page = (MeasurePage.find_by_name("西服上衣") ||
      MeasurePage.find(:first, :order => 'popularity DESC'))

    measure_property = MeasureProperty.create([
      {:name => "腰围", :description => '请照图用心测量 ', :photo => "/images/pic_xiu.gif", :unit => "inch", :measure_page_id => measure_page.id},
      {:name => "身高", :description => "请提供实际身高，谢谢！", :photo => "/images/pic_xiu.gif", :unit => "CM", :measure_page_id => measure_page.id}
    ])

    puts "adding inquiries..."
    inquiry = Inquiry.create([
      {:description => '今天的deal一个人可以买几张？'},
      {:description => '请问北京体验店晚上什么时候关门?', :reply => '一般在12点以后'}
    ])
    inquiry[0].user_id = User.find_by_email('kktest@kktest.com').id
    inquiry[0].reply = '您好，本优惠不限量哦'
    inquiry[0].replied_by = User.find_by_email('root@root.com').id
    inquiry[0].save


    inquiry[1].user_id = User.find_by_email('kktest@kktest.com').id
    inquiry[1].save

    puts "adding customizations..."
    customization = Customization.create([
      {:name => '直角一粒扣', :description => '关于我', :category => '领型', :photo => '/images/l1.jpg', :measure_page_id => measure_page.id},
      {:name => '第2料', :description => '你好', :category => '领型', :photo => '/images/l1.jpg', :measure_page_id => measure_page.id}
    ])

  end
end
