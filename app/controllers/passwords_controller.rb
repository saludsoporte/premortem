class PasswordsController < ApplicationController
  before_action :authenticate_user!
    def edit                        
        @user = User.find(params[:id])
        unless params[:error].nil?
            @error = params[:error]    
        end        
        logger.debug "****************** "+@user.to_s
    end

    def update                
        logger.debug "**********************"+user_params.to_s        
        ActiveRecord::Base.connection.execute("update users set email = 'correo@correo.com' where id = #{params[:id]} ")               
        @user = User.find(params[:id])
        if @user.update(user_params)
            ActiveRecord::Base.connection.execute("update users set email = null where id = #{@user.id} ")
            redirect_to home_administracion_path
        else            
            error=[]   
            if @user.errors.any?                
                @user.errors.full_messages.each do |m|
                    logger.debug "**************"+m.to_s                    
                    case m
                    when "Password can't be blank"
                        error=1     
                    when "Password confirmation doesn't match Password"                
                        error = 2
                    end
                end                
            end            
            redirect_to edit_password_path(id:@user.id,error:error)            
        end
    end

    private
    def user_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
