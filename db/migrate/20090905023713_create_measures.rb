#coding:utf-8
class CreateMeasures < ActiveRecord::Migration
  def self.up
    create_table :measures do |t|
      t.references :user
      #谁最后修改过？
      t.integer :who_updated
      #添加备注信息
      t.string :description

      t.integer :height
      t.string :occupation
      t.decimal :weight
      t.integer :age
      t.string :gender, :default => '帅哥'

      #coat
      t.string :coat_qianyichang,
        :coat_houyichang,
        :coat_xiongwei,
        :coat_duwei,
        :coat_zhongyao,
        :coat_jiankuan,
        :coat_xiuchang,
        :coat_xiabai,
        :coat_qiankuan,
        :coat_houkuan,
        :coat_bicu,
        :coat_xionggao,
        :coat_qianyaojie,
        :coat_houyaojie,
        :coat_description
      t.string :tixingtezheng,
        :chuanzhuoxiguan,
        :lingxing,
        :lizi,
        :koupai,
        :likou,
        :kaicha,
        :koudai

      #trousers
      t.string :trousers_kuchang,
        :trousers_yaochang,
        :trousers_tunwei,
        :trousers_lidang,
        :trousers_hengdang,
        :trousers_zhongdang,
        :trousers_kukou,
        :trousers_description

      #skirt
      t.string :skirt_qunchang,
        :skirt_yaowei,
        :skirt_tunwei,
        :skirt_qiwei,
        :skirt_description

      #vest
      t.string :vest_yichang,
        :vest_xiongwei,
        :vest_zhongyao,
        :vest_tunwei,
        :vest_description

      #shirt
      t.string :shirt_lingwei,
        :shirt_qianyichang,
        :shirt_houyichang,
        :shirt_xiongwei,
        :shirt_zhongyao,
        :shirt_jiankuan,
        :shirt_xiuchang,
        :shirt_wanwei,
        :shirt_bicu,
        :shirt_tunwei,
        :shirt_description
      #衬衫定制参数
      t.string :shirt_xiuzi,
        :shirt_ziti,
        :shirt_yanse,
        :shirt_weizhi

      #accessories
      t.string :lingdai,
        :pidai,
        :xiukoukou

      t.timestamps
    end
  end

  def self.down
    drop_table :measures
  end
end
