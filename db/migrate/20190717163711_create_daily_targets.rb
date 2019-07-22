class CreateDailyTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_targets do |t|
      t.string :project_name
      t.integer :target
    end
  end
end
