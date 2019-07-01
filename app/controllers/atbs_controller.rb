class AtbsController < ApplicationController
    require 'roo'
    def new
        @atb = Atb.new
    end

    def create
        # render plain: params[:atb][:excel_path].path.inspect
        path = params[:atb][:excel_path].path
        xlsx = Roo::Spreadsheet.open(path)
        header = xlsx.row(1)
        (2..xlsx.last_row).map do |i|
            row = Hash[[header, xlsx.row(i)].transpose]
            @atb = Atb.new(encounter_no: row["Encntr Number"], patient_name: row["Patient Name"], admit_date: row["Admit Date"], discharge_date: row["Disch Date"], billed_amount: row["Total Charges"], balance_amount: row["Current A/R Balance"], insurance_name: row["Current Health Plan"], user_allocation: row["Allocation"], associate_id: row["Associate ID"])
            if @atb.save 
                redirect_to atbs_path
                flash[:notice] = "ATB updated successfully"
            else
                render 'new'
            end
        end
    end

    def index
            if Atb.any?
            @atb = Atb.all
            else
                redirect_to root_path
                flash[:notice] = "No ATB found"
            end
    end
end