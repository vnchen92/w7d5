class Img < ActiveRecord::Migration[5.2]
  def change  
      add_column :subs, :img, :string, null: false, default: 'https://theme.zdassets.com/theme_assets/2219439/89cbe072bbb76fc29a82367bd19b511df487d018.png'
  end
end
