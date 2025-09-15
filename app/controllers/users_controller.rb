class UsersController < ApplicationController
  def registrar
    @nuevo_usuario = User.new()
  end
  def guardar_usuario        
    @area = Area.find(79)
    @nuevo_usuario = User.new(email:params[:user][:email],password:params[:user][:password],username:params[:user][:username],area_id:@area.id)
    if User.exists?(username:params[:user][:username])
        @error = 1        
    else
        @error = 0        
    end
    if @error == 0
      if @nuevo_usuario.save
        redirect_to new_datos_personal_path(user:@nuevo_usuario.id), notice: "Usuario creado exitosamente."
      else
        @error = 5
      end
    else      
      if params[:user][:username].blank?
        @error = 3
      elsif params[:user][:password].blank?
        @error = 4
      elsif params[:user][:password] != params[:user][:password_confirmation]
        @error = 2
      elsif User.exists?(username:params[:user][:username])        
        @error = 1        
      else
        @error = 0  
      end
      redirect_to users_registrar_path(error:@error)
    end
  end
end
