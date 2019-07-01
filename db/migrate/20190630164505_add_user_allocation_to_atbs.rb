class AddUserAllocationToAtbs < ActiveRecord::Migration[5.1]
  def change
    add_column :atbs, :user_allocation, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
