class WorkstationsController < ApplicationController
    def index
        # @atb = Atb.find_by_associate_id("SK055502")
        @atb_for_insurance_list = Atb.where("associate_id = ?", session[:associate_id])
          filter = params[:format].to_s
          filter_split = filter.split('/')
          balance_filter = filter_split[0].to_s
          insurance_filter = filter_split[1].to_s
        #    render plain: filter_split.inspect
           if filter_split.empty? || (balance_filter == "NA" && insurance_filter == "All")
            @atb = Atb.where("associate_id = ?", session[:associate_id])
           else
            
                if insurance_filter == "All" && balance_filter == "High To Low"
                    @atb = Atb.where("associate_id = ?", session[:associate_id]).order('balance_amount DESC')
                elsif insurance_filter == "All" && balance_filter == "Low To High"
                    @atb = Atb.where("associate_id = ?", session[:associate_id]).order('balance_amount')
                elsif insurance_filter != "All" && balance_filter == "High To Low"
                    @atb = Atb.where("associate_id = ? AND insurance_name = ?", session[:associate_id], insurance_filter).order('balance_amount DESC')
                elsif insurance_filter != "All" && balance_filter == "Low To High"
                    @atb = Atb.where("associate_id = ? AND insurance_name = ?", session[:associate_id], insurance_filter).order('balance_amount')
                elsif insurance_filter != "All"
                    @atb = Atb.where("associate_id = ? AND insurance_name = ?", session[:associate_id], insurance_filter)
                end

           end 
          
    end
    
    # def show
    #     @workstation = Workstation.where("associate_id = ?", session[:associate_id])
    # end

    def new
        #    render plain: params[:format].inspect
           id = params[:format]
           @atb = Atb.find(id)
           @workstation = Workstation.new
           @date = current.strftime("%m/%d/%Y")
           @em = Em.all
    end

    def create
        # associate_worked_date = params[:workstation][:date]
        @workstation = Workstation.new(workstation_params)
    

        if @workstation.save
            encounter = params[:workstation][:encounter_no]  
            Atb.where(:encounter_no => encounter).delete_all   # deleting the encounter once it is worked
            flash[:notice] = "Saved successfully"
            redirect_to workstations_path
        else
            render :new
        end
        # render plain: params.inspect
        # render plain: params[:workstation][:date].inspect
        
        # @associate_reports = AssociateProductionReport.where("date = ?", "07/22/2019")
        # @daily_target = DailyTarget.where("project_name = ?", "Conway")
        # target = @daily_target[0].target
        
        # if !@associate_reports.empty?
        #     target_new = AssociateProductionReport.find_by(date: associate_worked_date)
        #     render plain: target_new.inspect
        # else
        #     render plain: "NO".inspect
        # end
        
        
    end

    def workstation_params
        params.require(:workstation).permit(:encounter_no, :patient_name, :admit_date, :discharge_date, :billed_amount, :balance_amount, :insurance_name, :user_allocation, :associate_id, :notes, :status_code, :action_code, :date, :rm_checked, :cpdi, :clearing_house, :website_checked, :self_resolution, :source_of_resolution, :work_status => "Worked");
    end

    def atb_filter
        # redirect_to workstations_path
        # render plain: params.inspect
        atb_balance = params[:atb_balance]
        atb_insurance = params[:atb_insurance]
        atb_data = [atb_balance,atb_insurance]
        redirect_to workstations_path(atb_data)
    end

    def associate_allocation
        @master_atb = MasterAtb.where("associate_id = ?", session[:associate_id])
    end

    def associate_work_status
        @workstation = Workstation.where("associate_id = ?", session[:associate_id])
    end

    def associate_report
        @workstation = Workstation.where("associate_id = ?", session[:associate_id])  
        @daily_target = DailyTarget.where(project_name: "Conway").first          
    end

end