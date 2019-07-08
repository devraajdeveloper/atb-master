class CreateEms < ActiveRecord::Migration[5.1]
  def change
    create_table :ems do |t|
      t.string :status
      t.string :action
      t.string :rm_checked
      t.string :cpdi
      t.string :clearing_house
      t.string :website_checked
      t.string :self_resolvable
      t.string :source_of_resolution
    end
  end
end
