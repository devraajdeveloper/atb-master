class CreateAtbs < ActiveRecord::Migration[5.1]
  def change
    create_table :atbs do |t|
      t.string :encounter_no
      t.string :patient_name
      t.string :admit_date
      t.string :discharge_date
      t.string :billed_amount
      t.string :balance_amount
      t.string :insurance_name
    end
  end
end
