class AssociatesController < ApplicationController
    def new
        @associate = Associate.new
    end

    def create
        @associate = Associate.new(associate_params)
        if @associate.save
            flash[:notice] = "Article saved successfully"
            redirect_to associates_path(@associate)
        else
            render :new
        end
    end

    def associate_params
        params.require(:associate).permit(:associate_id, :associate_name, :project_name, :password);
    end

    def index
        @associate = Associate.all
    end
end