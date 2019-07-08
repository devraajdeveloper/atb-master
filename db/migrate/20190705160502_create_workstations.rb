class CreateWorkstations < ActiveRecord::Migration[5.1]
  def change
    create_table :workstations do |t|
      t.string :encounter_no
      t.string :patient_name
      t.string :admit_date
      t.string :discharge_date
      t.string :billed_amount
      t.string :balance_amount
      t.string :insurance_name
      t.string :user_allocation
      t.string :associate_id
      t.string :notes
      t.string :status_code
      t.string :action_code
      t.string :date
      t.string :rm_checked
      t.string :cpdi
      t.string :clearing_house
      t.string :website_checked
      t.string :self_resolution
      t.string :source_of_resolution
    end
  end
end
