class ApplicationController < ActionController::Base


    def home
        if user_signed_in?
            redirect_to moves_path
        end    
    end
end
