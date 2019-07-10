class WorkstationsController < ApplicationController
    def index
        # @atb = Atb.find_by_associate_id("SK055502")
        @atb = Atb.where("associate_id = ?", session[:associate_id])   
    end
    
    def show
        @workstation = Workstation.where("associate_id = ?", session[:associate_id])
    end

    def new
        #    render plain: params[:format].inspect
           id = params[:format]
           @atb = Atb.find(id)
           @workstation = Workstation.new
           @date = current.strftime("%m-%d-%Y")
           @em = Em.all
    end

    def create
        @workstation = Workstation.new(workstation_params)
        if @workstation.save
            encounter = params[:workstation][:encounter_no]  
            Atb.where(:encounter_no => encounter).delete_all   # deleting the encounter once it is worked
            flash[:notice] = "Saved successfully"
            redirect_to workstations_path()
        else
            render :new
        end
    end

    def workstation_params
        params.require(:workstation).permit(:encounter_no, :patient_name, :admit_date, :discharge_date, :billed_amount, :balance_amount, :insurance_name, :user_allocation, :associate_id, :notes, :status_code, :action_code, :date, :rm_checked, :cpdi, :clearing_house, :website_checked, :self_resolution, :source_of_resolution, :work_status => "Worked");
    end

end