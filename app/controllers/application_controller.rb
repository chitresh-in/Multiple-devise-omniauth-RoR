class ApplicationController < ActionController::Base

    # before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Redirect after sign in
  def after_sign_in_path_for(resource)
    if resource.class == User
      home_index_path
    elsif resource.class == Company
      openings_path
    end 
  end

  #Redirect after sign out
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user      
      new_user_session_path
    elsif resource_or_scope == :company
      openings_path
    end 
  end



#   protected

#   def configure_permitted_parameters
    
#     if resource_class == Company
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :about, :logo])
#       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :about, :logo])
#     elsif resource_class == Candidate
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :about, :roll_no])
#       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :about, :roll_no])

#     end
#   end
end
