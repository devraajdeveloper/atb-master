class WorkstationsController < ApplicationController
    def index
        # @atb = Atb.find_by_associate_id("SK055502")
        @atb = Atb.where("associate_id = ?", session[:associate_id])    
    end

    def edit
       
    end
    def new
        #    render plain: params[:format].inspect
           id = params[:format]
           @atb = Atb.find(id)
           @workstation = Workstation.new
           @date = current
            
           @em = Em.all
    end

end