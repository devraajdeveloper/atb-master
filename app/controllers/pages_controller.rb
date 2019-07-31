class PagesController < ApplicationController
    def home
        require_supervisor_access
    end

    def new

    end

    def login
        if logged_in?
         if session[:access] == "Associate"
            redirect_to pages_workstation_home_path
        elsif session[:access] == "Supervisor"
            redirect_to pages_home_path
        end
    end
    end

    def create

        user = Associate.find_by(associate_id: params[:session][:associate_id])
        user_id = user.id
        access = Associate.find(user_id).access

        if user && user.authenticate(params[:session][:password]) && access == "Supervisor"
            session[:id] = user.id
            session[:associate_id] = user.associate_id
            session[:associate_name] = user.associate_name  
            session[:access] = user.access         
            flash[:notice] = "Hi #{session[:associate_name]} welcome to ATB Master"
            redirect_to pages_home_path()

        elsif user && user.authenticate(params[:session][:password]) && access == "Associate"
                session[:id] = user.id
                session[:associate_name] = user.associate_name           
                session[:associate_id] = user.associate_id
                session[:associate_name] = user.associate_name    
                session[:access] = user.access
                flash[:notice] = "Hi #{session[:associate_name]} welcome to ATB Master"
                redirect_to pages_workstation_home_path()   
        else
            flash[:notice] = "Username/Password is incorrect"
            render 'login'
        end

    end

    def workstation_home
        require_associate_access
    end

    def destroy
        session[:id] = nil
        session[:associate_id] = nil
        session[:associate_name] = nil
        flash[:notice] = "You have logged out"
        redirect_to root_path
    end
end