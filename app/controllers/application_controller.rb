class ApplicationController < ActionController::Base
  def configure_permitted_parameters
        added_attrs = [:login,:username,:password, :password_confirmation, :remember_me,:id]        
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs        
  end 
end
