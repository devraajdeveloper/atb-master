class ChangeBalanceAmountToAtbs < ActiveRecord::Migration[5.1]
  def change
    change_column :atbs, :balance_amount, :float
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
