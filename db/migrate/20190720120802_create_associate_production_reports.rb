class CreateAssociateProductionReports < ActiveRecord::Migration[5.1]
  def change
    create_table :associate_production_reports do |t|
      t.string :date
      t.integer :daily_target
      t.integer :daily_achieved
      t.integer :mtd_target
      t.integer :mtd_achieved
      t.string  :mtd_achieved_percentage
      t.integer :deficit
      t.string :associate_id
      t.string :associate_name
      t.string :project_name
    end
  end
end
