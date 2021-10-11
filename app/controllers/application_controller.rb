class ApplicationController < ActionController::Base
   def require_blogger
     if !blogger_signed_in?
        flash[:alert]="You must be logged in to perform that action"
        redirect_to new_blogger_session_path
     end
   end
    
   def after_sign_in_path_for(resource)
       blogger_path(current_blogger)
   end
end

