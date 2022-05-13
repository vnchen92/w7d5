class Birthdate < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :birthdate, :date, null: false, default: '2000/01/01'
      #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
