class DatosPersonalsController < ApplicationController
  def edit
    @datos_personal = DatosPersonal.find(params[:id])        
  end
  def update            
    @datos_personal = DatosPersonal.find(params[:id])        
    if @datos_personal.update(
      nombre: params[:datos_personal][:nombre],
      apellido_paterno: params[:datos_personal][:apellido_paterno],
      apellido_materno: params[:datos_personal][:apellido_materno],
      puesto: params[:datos_personal][:puesto],
      titulo: params[:datos_personal][:titulo],
      curp: params[:datos_personal][:curp]
    )
      redirect_to home_administracion_path(datos:true)
    else
      redirect_to home_administracion_path(datos:false)
    end
  end
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
