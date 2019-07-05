class PagesController < ApplicationController
    def home
       
    end

    def new

    end

    def create

        user = Associate.find_by(associate_id: params[:session][:associate_id])
        if user && user.authenticate(params[:session][:password])
            session[:associate_id] = user.id
            flash[:notice] = "You have successfully logged in"
            redirect_to pages_home_path(user)
        else
            flash[:notice] = "something is wrong"
            render 'login'
        end

    end

    def destroy
        session[:associate_id] = nil
        flash[:notice] = "You have logged out"
        redirect_to root_path
    end
end