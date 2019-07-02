class PagesController < ApplicationController
    def home
       
    end

    def login
        @associate = Associate.new
    end
end