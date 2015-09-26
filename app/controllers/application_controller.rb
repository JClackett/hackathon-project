class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def configure_devise_permitted_parameters
    registration_params = [:first_name, :doctor, :last_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

# This redirects users upon sign in
def after_sign_in_path_for(resource)

  if current_user.doctor == true
    posts_path
  else
    @onion = Patient.where(user_id: current_user.id).first.id
    patient_path(@onion)
  end

end

# This redirects users upon sign out
def after_sign_out(resource_or_scope)
  static_pages_path
end


end
