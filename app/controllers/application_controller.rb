class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# This redirects users upon sign in
def after_sign_in_path_for(resource)

  if current_user.doctor == true
    redirect_to patient_path
  elsif current_user.doctor == false
    redirect_to posts_path
  else
    static_pages_path
  end
 
end

# This redirects users upon sign out
def after_sign_out(resource_or_scope)
  static_pages_path
end
  
end
