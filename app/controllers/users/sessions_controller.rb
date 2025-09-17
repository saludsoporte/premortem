# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action(only: [:create, :destroy]) { request.env["devise.skip_timeout"] = true }
  #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new        
    super    
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def create    
    logger.debug "************************INICIANDO SESIÓN***************************"+current_user.nil?.to_s  
    unless current_user.nil?      
      if current_user.datos_personal.nil? 
        destroy
      end
    end
    super
  end
  def destroy
    #ActiveRecord::Base.connection.execute("update documentos.users set consulta = false where id=#{current_user.id}")
    #current_user.update(consulta:false)
    logger.debug "************************CERRANDO SESIÓN***************************"
    #historial_dest=DeTemp.where(user_actual:current_user.user_id)
    #historial_dest.destroy_all
    super
  end
end
