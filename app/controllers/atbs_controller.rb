class AtbsController < ApplicationController
    require 'roo'
    def new
        require_supervisor_access 
        @atb = Atb.new
    end

    def create
        require_supervisor_access
        # render plain: params[:atb][:excel_path].path.inspect
        path = params[:atb][:excel_path].path
        xlsx = Roo::Spreadsheet.open(path)
        header = xlsx.row(1)
        (2..xlsx.last_row).map do |i|
            row = Hash[[header, xlsx.row(i)].transpose]
            @atb = Atb.new(encounter_no: row["Encntr Number"], patient_name: row["Patient Name"], admit_date: row["Admit Date"], discharge_date: row["Disch Date"], billed_amount: row["Total Charges"], balance_amount: row["Current A/R Balance"], insurance_name: row["Current Health Plan"], user_allocation: row["Allocation"], associate_id: row["Associate ID"])
            @master_atb = MasterAtb.new(encounter_no: row["Encntr Number"], patient_name: row["Patient Name"], admit_date: row["Admit Date"], discharge_date: row["Disch Date"], billed_amount: row["Total Charges"], balance_amount: row["Current A/R Balance"], insurance_name: row["Current Health Plan"], user_allocation: row["Allocation"], associate_id: row["Associate ID"])
            if @atb.save && @master_atb.save
                flash[:notice] = "ATB updated successfully"
            else
                render 'new'
            end
        end
        redirect_to atbs_path
    end

    
    def index
            require_supervisor_access
                if Atb.any? 
                @atb = Atb.order(:balance_amount)
                else
                    redirect_to pages_home_path
                    flash[:notice] = "No ATB found"
                end
    end

    def edit
            require_supervisor_access
        @atb = Atb.find(params[:id])
    end

    def update
        require_supervisor_access
        @atb= Atb.find(params[:id])
        if @atb.update(atb_params)
            flash[:notice] = "Record updated successfully"
            redirect_to atbs_path
        else
            render :edit
        end
    end

    def destroy
        require_supervisor_access
        @atb = Atb.find(params[:id])
        @atb.destroy
        flash[:notice] = "Record is successfully deleted"
        redirect_to pages_home_path
    end

    def atb_params
        params.require(:atb).permit(:encounter_no, :patient_name, :admit_date, :discharge_date, :billed_amount, :balance_amount, :insurance_name, :user_allocation, :associate_id);
    end

end