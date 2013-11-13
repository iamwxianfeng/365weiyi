# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131113153756) do

  create_table "banners", :force => true do |t|
    t.string   "name",       :default => ""
    t.string   "photo_url",  :default => "/images/flash_img.gif"
    t.string   "link_to",    :default => "#"
    t.integer  "popularity", :default => 0
    t.boolean  "can_scroll", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_comments", :force => true do |t|
    t.integer  "blog_post_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_comments", ["blog_post_id"], :name => "index_blog_comments_on_blog_post_id"
  add_index "blog_comments", ["user_id"], :name => "index_blog_comments_on_user_id"

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "category_id"
    t.integer  "product1_id"
    t.integer  "product2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "published"
    t.integer  "blog_comments_count"
  end

  add_index "blog_posts", ["category_id"], :name => "index_blog_posts_on_category_id"
  add_index "blog_posts", ["product1_id"], :name => "index_blog_posts_on_product1_id"
  add_index "blog_posts", ["product2_id"], :name => "index_blog_posts_on_product2_id"
  add_index "blog_posts", ["user_id"], :name => "index_blog_posts_on_user_id"

  create_table "blog_tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blog_post_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "url",                 :default => "suit"
    t.integer  "popularity",          :default => 0
    t.string   "logo"
    t.integer  "subcategories_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chat_users", :force => true do |t|
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", :force => true do |t|
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "channel"
    t.boolean  "viewed"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "comments", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "popularity", :default => 0
    t.boolean  "approved",   :default => false
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "website"
    t.integer  "user_id"
    t.integer  "popularity", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "height"
    t.string   "weight"
    t.string   "job"
    t.string   "like"
    t.integer  "style",          :default => 0
    t.integer  "other_style",    :default => 0
    t.text     "desp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic1"
    t.string   "pic2"
    t.integer  "suit_product1"
    t.integer  "suit_product2"
    t.integer  "suit_product3"
    t.integer  "shirt_product1"
    t.integer  "shirt_product2"
    t.integer  "shirt_product3"
    t.integer  "other_product1"
    t.integer  "other_product2"
    t.integer  "other_product3"
  end

  create_table "customization_wraps", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customizations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category",        :default => "领型"
    t.string   "photo",           :default => "/images/l1.jpg"
    t.integer  "popularity",      :default => 0
    t.integer  "measure_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.decimal  "price",      :precision => 10, :scale => 0, :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name",        :default => "匿名"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helps", :force => true do |t|
    t.string   "name",        :default => ""
    t.string   "title",       :default => ""
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "approved",    :default => false
    t.text     "reply"
    t.integer  "replied_by"
    t.integer  "popularity",  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.decimal  "price",       :precision => 10, :scale => 0, :default => 0
    t.integer  "quantity",                                   :default => 1,   :null => false
    t.decimal  "total_price", :precision => 8,  :scale => 2, :default => 0.0, :null => false
    t.string   "measure",                                    :default => ""
    t.integer  "product_id",                                                  :null => false
    t.integer  "order_id",                                                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kadmin_comments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url",         :default => "http://www.dooxoo.cn"
    t.string   "logo",        :default => "/images/link_defaut.gif"
    t.boolean  "approved",    :default => false
    t.integer  "popularity",  :default => 0
    t.integer  "user_id",                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measure_categories", :force => true do |t|
    t.string   "name"
    t.integer  "popularity", :default => 0
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measure_pages", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "favorite_brand"
    t.integer  "popularity",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measure_properties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.string   "unit",            :default => "CM"
    t.integer  "popularity",      :default => 0
    t.integer  "measure_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", :force => true do |t|
    t.string   "name"
    t.string   "measure"
    t.integer  "popularity",          :default => 0
    t.integer  "measure_property_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measures", :force => true do |t|
    t.integer  "user_id"
    t.integer  "who_updated"
    t.string   "description"
    t.integer  "height"
    t.string   "occupation"
    t.decimal  "weight",               :precision => 10, :scale => 0
    t.integer  "age"
    t.string   "gender",                                              :default => "帅哥"
    t.string   "coat_qianyichang"
    t.string   "coat_houyichang"
    t.string   "coat_xiongwei"
    t.string   "coat_duwei"
    t.string   "coat_zhongyao"
    t.string   "coat_jiankuan"
    t.string   "coat_xiuchang"
    t.string   "coat_xiabai"
    t.string   "coat_qiankuan"
    t.string   "coat_houkuan"
    t.string   "coat_bicu"
    t.string   "coat_xionggao"
    t.string   "coat_qianyaojie"
    t.string   "coat_houyaojie"
    t.string   "coat_description"
    t.string   "tixingtezheng"
    t.string   "chuanzhuoxiguan"
    t.string   "lingxing"
    t.string   "lizi"
    t.string   "koupai"
    t.string   "likou"
    t.string   "kaicha"
    t.string   "koudai"
    t.string   "trousers_kuchang"
    t.string   "trousers_yaochang"
    t.string   "trousers_tunwei"
    t.string   "trousers_lidang"
    t.string   "trousers_hengdang"
    t.string   "trousers_zhongdang"
    t.string   "trousers_kukou"
    t.string   "trousers_description"
    t.string   "skirt_qunchang"
    t.string   "skirt_yaowei"
    t.string   "skirt_tunwei"
    t.string   "skirt_qiwei"
    t.string   "skirt_description"
    t.string   "vest_yichang"
    t.string   "vest_xiongwei"
    t.string   "vest_zhongyao"
    t.string   "vest_tunwei"
    t.string   "vest_description"
    t.string   "shirt_lingwei"
    t.string   "shirt_qianyichang"
    t.string   "shirt_houyichang"
    t.string   "shirt_xiongwei"
    t.string   "shirt_zhongyao"
    t.string   "shirt_jiankuan"
    t.string   "shirt_xiuchang"
    t.string   "shirt_wanwei"
    t.string   "shirt_bicu"
    t.string   "shirt_tunwei"
    t.string   "shirt_description"
    t.string   "shirt_xiuzi"
    t.string   "shirt_ziti"
    t.string   "shirt_yanse"
    t.string   "shirt_weizhi"
    t.string   "lingdai"
    t.string   "pidai"
    t.string   "xiukoukou"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chat_id"
    t.integer  "user_id"
  end

  create_table "notices", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.string   "url"
    t.text     "description"
    t.integer  "hit",         :default => 0
    t.integer  "popularity",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "name",                                                               :null => false
    t.string   "address",                                         :default => "好好啊"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "payment",                                         :default => "现金"
    t.string   "extra_information"
    t.string   "shipping",                                        :default => "自取"
    t.string   "appointment"
    t.string   "progress",                                        :default => "待确认"
    t.decimal  "discount",          :precision => 6, :scale => 2, :default => 1.0
    t.decimal  "total_price",       :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.integer  "items_count",                                     :default => 0
    t.integer  "user_id"
    t.integer  "operator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "popularity", :default => 0
    t.string   "mark"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "provice"
    t.string   "city"
    t.string   "area"
    t.string   "street"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["user_id"], :name => "index_places_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "serial_number"
    t.string   "origin"
    t.string   "component"
    t.string   "yarn"
    t.string   "color"
    t.text     "description"
    t.text     "details"
    t.decimal  "market_price",     :precision => 10, :scale => 0
    t.decimal  "our_price",        :precision => 10, :scale => 0
    t.string   "measure",                                         :default => ""
    t.integer  "subcategory_id"
    t.integer  "popularity",                                      :default => 0
    t.boolean  "availability",                                    :default => true,  :null => false
    t.integer  "photos_count",                                    :default => 0
    t.integer  "comments_count",                                  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "customizable",                                    :default => false
    t.string   "contact"
    t.string   "for_who"
    t.string   "for_where"
    t.string   "weight"
    t.text     "pictures_show"
    t.string   "material_picture"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zipcode"
    t.string   "website"
    t.string   "institution"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "height"
    t.string   "figure"
    t.integer  "qq"
    t.string   "weibo"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "replies", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reserve_rulers", :force => true do |t|
    t.integer  "user_id"
    t.datetime "reserve_at"
    t.integer  "place_id"
    t.string   "office"
    t.text     "items"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "day_when"
    t.string   "username"
    t.integer  "shop_id"
    t.integer  "status"
    t.integer  "reserve_id"
    t.integer  "product_id"
    t.string   "height"
    t.string   "weight"
    t.string   "fee"
  end

  add_index "reserve_rulers", ["place_id"], :name => "index_reserve_rulers_on_place_id"
  add_index "reserve_rulers", ["reserve_id"], :name => "index_reserve_rulers_on_reserve_id"
  add_index "reserve_rulers", ["shop_id"], :name => "index_reserve_rulers_on_shop_id"
  add_index "reserve_rulers", ["user_id"], :name => "index_reserve_rulers_on_user_id"

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.string   "url",            :default => "man"
    t.integer  "popularity"
    t.integer  "products_count"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "top_rulers", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "top_rulers", ["user_id"], :name => "index_top_rulers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                                                                    :null => false
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "credit",                                                                :default => 0
    t.decimal  "discount",                                :precision => 6, :scale => 2, :default => 1.0
    t.integer  "role",                                                                  :default => 2
    t.boolean  "is_company",                                                            :default => false
    t.string   "login_from"
    t.datetime "login_at"
    t.integer  "orders_count",                                                          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
