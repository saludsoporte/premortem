class DatosPersonalsController < ApplicationController
  def edit
    @datos_personal = DatosPersonal.find(params[:id])        
    @user = User.find(@datos_personal.user_id) 
  end
  def update            
    @datos_personal = DatosPersonal.find(params[:id])        
    if @datos_personal.update(
      nombre: params[:datos_personal][:nombre],
      apellido_paterno: params[:datos_personal][:apellido_paterno],
      apellido_materno: params[:datos_personal][:apellido_materno],
      puesto: params[:datos_personal][:puesto],
      unidad: params[:datos_personal][:unidad],
      curp: params[:datos_personal][:curp],
      clues:params[:datos_personal][:clues],
      correo:params[:datos_personal][:correo]
    )
      redirect_to home_administracion_path(datos:true)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def new    
    @datos_personal = DatosPersonal.new()
    @user = User.find(params[:user]) if params[:user].present?
  end
  def create      
    @area = Area.find(79)  
    usuario_nuevo = User.new(
      username: params[:datos_personal][:usuario],
      email: "correo@gmail.com",
      area_id:@area.id,
      password: params[:datos_personal][:password],
      rol:params[:datos_personal][:rol])
    existe = User.find_by(username: params[:datos_personal][:usuario]).nil? == false ? true : false
    logger.debug "********** EXISTE USUARIO ******************"+existe.to_s
    
    if params[:datos_personal][:curp].length == 18 && existe == false
      usuario_nuevo.save
    end    
    @datos_personal = DatosPersonal.new(
      nombre: params[:datos_personal][:nombre],
      apellido_paterno: params[:datos_personal][:apellido_paterno],
      apellido_materno: params[:datos_personal][:apellido_materno],
      puesto: params[:datos_personal][:puesto],
      unidad: params[:datos_personal][:unidad],
      curp: params[:datos_personal][:curp],
      correo:params[:datos_personal][:correo],
      carta:params[:datos_personal][:carta],
      user_id: usuario_nuevo.id
    )
    if @datos_personal.save
      redirect_to home_administracion_path,notice: "Datos personales guardados exitosamente."
    else      
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
        unidad: params[:unidad],
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
    elsif params[:unidad].blank?      
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
