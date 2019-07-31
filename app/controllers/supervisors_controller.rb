class SupervisorsController < ApplicationController
    def work_status
        require_supervisor_access
        @workstation = Workstation.all
    end
end