class AddUserAllocationAndAssociateIdToMasterAtbs < ActiveRecord::Migration[5.1]
  def change
    add_column :master_atbs, :user_allocation, :string
    add_column :master_atbs, :associate_id, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
