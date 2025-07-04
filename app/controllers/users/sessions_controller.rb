# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

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
  logger.debug "************************INICIANDO SESIÓN***************************"
  unless current_user.nil?      
    #buzon = Buzone.find_by(user_id:current_user.id)
    #busqueda = Busqueda.find_by(user_id:current_user.id)
    #logger.debug "************************INICIANDO SESIÓN***************************"+buzon.id.to_s      
    #if busqueda.nil?        
    #  busqueda = Busqueda.new(user_id:current_user.id,activa:false)
    #  busqueda.save
    #end
    #if buzon.nil?        
    #  case current_user.rol_id
    #    when 1
    #    when 2
    #    when 3        
    #    buzones=[#Buzone.new(nombre: "ENTRADA", user_id:current_user.id),
    #      Buzone.new(nombre:"CREADOS",user_id:current_user.id)          
          #Buzone.new(nombre: "SALIDA", user_id:current_user.id)            
    #    ]
    #    when 4
    #      buzones=[              
    #        Buzone.new(nombre:"CREADOS",user_id:current_user.id)          
    #      ]
    #  end        
    #  buzones.each do |b|
    #    b.save
    #  end
    #end
    #if current_user.rol_id == 2 || current_user.rol_id == 3
    #  logger.debug "************************REDIRECCIONANDO ***************************"
    #  return redirect_to relacion_oficials_path
    #elsif current_user.rol_id == 1
    #  logger.debug "************************ ES ADMIN ***************************"
    #  return redirect_to admins_path
    #else        
    #end
    #if current_user.personal.activo == false
    #  destroy
    #end
  end   
  logger.debug "************************USER NIL ? ***************************"+current_user.nil?.to_s
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
