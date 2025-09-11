class DatosPersonalsController < ApplicationController
  def guardar_datos
    if validar
      # Guardar los datos
      datos = DatosPersonal.new(
        nombre: params[:nombre],
        apellidos: params[:apellidos],
        puesto: params[:puesto],
        titulo: params[:titulo],
        user_id:params[:user]
      )
      if datos.save
        redirect_to root_path(datos:true)
      else
        redirect_to root_path(datos:false)
      end
    else      
      redirect_to root_path(datos:false,error:true)
    end    
  end
  def validar    
    bandera = true
    if params[:nombre].blank?      
      bandera = false
    elsif params[:apellidos].blank?      
      bandera = false
    elsif params[:puesto].blank?      
      bandera = false
    elsif params[:titulo].blank?      
      bandera = false
    else
      bandera = true
    end
    return bandera
  end
  def show
    @datos_personal = DatosPersonal.find(params[:id])
  end
end
