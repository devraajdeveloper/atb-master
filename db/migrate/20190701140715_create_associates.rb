class CreateAssociates < ActiveRecord::Migration[5.1]
  def change
    create_table :associates do |t|
      t.string :associate_id
      t.string :associate_name
      t.string :project_name
      t.string :password
    end
  end
end
