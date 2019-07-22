class AssociatesController < ApplicationController
    def new
        require_supervisor_access
        @associate = Associate.new
    end

    def create
        require_supervisor_access
        @associate = Associate.new(associate_params)
        if @associate.save
            flash[:notice] = "Article saved successfully"
            redirect_to associates_path(@associate)
        else
            render :new
        end
    end

    def update
        require_supervisor_access
        @associate= Associate.find(params[:id])
        if @associate.update(associate_params)
            flash[:notice] = "Record updated successfully"
            redirect_to associates_path(@associate)
        else
            render :edit
        end
    end

    def destroy
        require_supervisor_access
        @associate = Associate.find(params[:id])
        @associate.destroy
        flash[:notice] = "Article is successfully deleted"
        redirect_to associates_path
    end

    def associate_params
        params.require(:associate).permit(:associate_id, :associate_name, :project_name, :password, :access);
    end

    def index
        require_supervisor_access
        @associate = Associate.all
    end

    def edit
        require_supervisor_access
        @associate = Associate.find(params[:id]);
    end
end