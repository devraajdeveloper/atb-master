class RemovePasswordFromAssociates < ActiveRecord::Migration[5.1]
  def change
    remove_column :associates, :password
  end
end
