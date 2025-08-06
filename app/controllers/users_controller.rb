class UsersController < ApplicationController
  def registrar
    @nuevo_usuario = User.new()
  end
  def guardar_usuario    
    @nuevo_usuario = User.new(email:params[:user][:email],password:params[:user][:password],username:params[:user][:username])
    if User.exists?(username:params[:user][:username])
        @error = 1        
    else
        @error = 0        
    end
    if @error == 0
      if @nuevo_usuario.save
        redirect_to user_session_path, notice: "Usuario creado exitosamente."
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
