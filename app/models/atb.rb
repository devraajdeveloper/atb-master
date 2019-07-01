class Atb < ApplicationRecord
    validates :encounter_no, presence: true, uniqueness: true
    validates :patient_name, presence: true
    validates :admit_date, presence: true
    validates :discharge_date, presence: true
    validates :billed_amount, presence: true
    validates :balance_amount, presence: true
    validates :insurance_name, presence: true
    validates :user_allocation, presence: true
end