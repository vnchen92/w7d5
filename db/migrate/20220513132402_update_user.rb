class UpdateUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :picture_url
    add_column :users, :picture_url, :string, null: false, default: 'https://cdn-icons-png.flaticon.com/512/1384/1384067.png'
  end
end
