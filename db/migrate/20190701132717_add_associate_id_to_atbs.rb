class AddAssociateIdToAtbs < ActiveRecord::Migration[5.1]
  def change
    add_column :atbs, :associate_id, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
