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
  def new    
    @datos_personal = DatosPersonal.new()
    @user = User.find(params[:user]) if params[:user].present?
  end
  def create
    @datos_personal = DatosPersonal.new(
      nombre: params[:datos_personal][:nombre],
      apellido_paterno: params[:datos_personal][:apellido_paterno],
      apellido_materno: params[:datos_personal][:apellido_materno],
      puesto: params[:datos_personal][:puesto],
      titulo: params[:datos_personal][:titulo],
      curp: params[:datos_personal][:curp],
      user_id: params[:datos_personal][:user]
    )
    if @datos_personal.save
      redirect_to home_administracion_path,notice: "Datos personales guardados exitosamente."
    else
      @user = User.find(params[:datos_personal][:user]) if params[:datos_personal][:user].present?
      render :new, status: :unprocessable_entity
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
