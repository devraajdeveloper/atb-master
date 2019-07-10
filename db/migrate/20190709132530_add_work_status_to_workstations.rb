class AddWorkStatusToWorkstations < ActiveRecord::Migration[5.1]
  def change
    add_column :workstations, :work_status, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
