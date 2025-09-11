class HomeController < ApplicationController
  before_action :authenticate_user!
  def index    
    busqueda= current_user.busqueda
    if !busqueda.nil?      
      if busqueda.activa        
        @buzones = consultar_busqueda(busqueda)        
      else
        @buzones = Buzone.paginate(page:params[:page]).all.order(created_at: :desc)    
      end    
    else
      @buzones = Buzone.paginate(page:params[:page]).all.order(created_at: :desc)    
    end
  end
  def administracion
    @usuarios = User.all.paginate(page: params[:page]).order(created_at: :desc)
  end
  def eliminar    
    @usuario = User.find(params[:id])
    if @usuario.destroy
      flash[:success] = "Usuario eliminado exitosamente."
    else
      flash[:error] = "Error al eliminar usuario."
    end
    redirect_to home_administracion_path
  end
  def limpiar_busqueda
    busqueda= current_user.busqueda
    busqueda.update(activa: false) if !busqueda.nil?
    redirect_to root_path    
  end
  def consultar_busqueda(busqueda)
    logger.debug "********** CONSULTAR BUSQUEDA ******************"
    sql = ""
    busqueda.attributes.each do |key, value|      
      case key
      when "nombre_p"
          if value != "" && !value.nil?
            logger.debug "Buscando por nombre paciente: #{value}"           
            sql += "nombre_paciente ILIKE ('%#{value}%') "           
          end
      when "apellido_pp"        
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido paciente: #{value}" 
            if sql == ""
              sql += "apellido_p_paciente ILIKE ('%#{value}%') "
            else
              sql += "AND apellido_p_paciente ILIKE ('%#{value}%') "
            end
        end
      when "apellido_mp"
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido materno paciente: #{value}" 
            if sql == ""
              sql += "apellido_m_paciente LIKE ('%#{value}%') "
            else
              sql += "AND apellido_m_paciente LIKE ('%#{value}%')  "
            end
        end
      when "nombre_n"
        if value != "" && !value.nil?
            logger.debug "Buscando por nombre notario: #{value}"
            if sql == ""
              sql += "nombre_notario ILIKE ('%#{value}%') "
            else
              sql += "AND nombre_notario ILIKE ('%#{value}%') "
            end
        end
      when "apellido_pn"
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido paterno notario: #{value}"
            if sql == ""
              sql += "apellido_p_notario ILIKE ('%#{value}%') "
            else
              sql += "AND apellido_p_notario ILIKE ('%#{value}%') "
            end
        end
      when "apellido_mn"
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido materno notario: #{value}"
            if sql == ""
              sql += "apellido_m_notario ILIKE ('%#{value}%') "
            else
              sql += "AND apellido_m_notario ILIKE ('%#{value}%') "
            end
        end
      when "nombre_r"
        if value != "" && !value.nil?
            logger.debug "Buscando por nombre responsable: #{value}"
            if sql == ""
              sql += "nombre_responsable ILIKE ('%#{value}%') "
            else
              sql += "AND nombre_responsable ILIKE ('%#{value}%') "
            end
        end
      when "apellido_pr"
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido paterno responsable: #{value}"
            if sql == ""
              sql += "apellido_p_responsable ILIKE ('%#{value}%') "
            else
              sql += "AND apellido_p_responsable ILIKE ('%#{value}%') "
            end
        end
      when "apellido_mr"
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido materno responsable: #{value}"
            if sql == ""
              sql += "apellido_m_responsable ILIKE ('%#{value}%') "
            else
              sql += "AND apellido_m_responsable ILIKE ('%#{value}%') "
            end
        end
      when "nombre_ro"  
        if value != "" && !value.nil?
            logger.debug "Buscando por nombre responsable opcional: #{value}"
            if sql == ""
              sql += "nombre_res_op ILIKE ('%#{value}%') "
            else
              sql += "AND nombre_res_op ILIKE ('%#{value}%') "
            end
        end
      when "apellido_pro"
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido paterno responsable opcional: #{value}"
            if sql == ""
              sql += "apellido_p_res_op ILIKE ('%#{value}%') "
            else
              sql += "AND apellido_p_res_op ILIKE ('%#{value}%') "
            end
        end
      when "apellido_mro"
        if value != "" && !value.nil?
            logger.debug "Buscando por apellido materno responsable opcional: #{value}"
            if sql == ""
              sql += "apellido_m_res_op ILIKE ('%#{value}%') "
            else
              sql += "AND apellido_m_res_op ILIKE ('%#{value}%') "
            end
        end
      when "no_documento"
        if value != "" && !value.nil?
            logger.debug "Buscando por no. documento: #{value}"
            if sql == ""
              sql += "no_documento ILIKE ('%#{value}%') "
            else
              sql += "AND no_documento ILIKE ('%#{value}%') "
            end
        end
      when "area"
        if !value.nil? && value != ""
            logger.debug "Buscando por area: #{value}"
            if sql == ""
              sql += "area_id = '#{value}' "
            else
              sql += "AND area_id = '#{value}' "
            end
        end
      when "f_recp"        
        if !value.nil? && value != ""
            logger.debug "Buscando por fecha de recepción: #{value}"            
            if sql == ""            
              sql += "fecha_recepcion = '#{value}' "
            else              
              sql += "AND fecha_recepcion = '#{value}' "
            end
        end
      when "f_disp"
        if !value.nil? && value != ""
            logger.debug "Buscando por fecha de disposición: #{value}"            
            if sql == ""
              sql += "fecha_disp = '#{value}' "
            else
              sql += "AND fecha_disp = '#{value}' "
            end
        end
      when "f_clon"
        if !value.nil? && value != ""
            logger.debug "Buscando por fecha de clonación: #{value}"            
            if sql == ""
              sql += "fecha_clonclucion = '#{value}' "
            else
              sql += "AND fecha_clonclucion = '#{value}' "
            end
        end
      when "no_inst"
        if !value.nil? && value != ""
            logger.debug "Buscando por no. instrumento: #{value}"
            if sql == ""
              sql += "no_instrumento ILIKE ('%#{value}%') "
            else
              sql += "AND no_instrumento ILIKE ('%#{value}%') "
            end
        end
      when "no_libro"
        if !value.nil? && value != ""
            logger.debug "Buscando por no. libro: #{value}"
            if sql == ""
              sql += "no_libro ILIKE ('%#{value}%') "
            else
              sql += "AND no_libro ILIKE ('%#{value}%') "
            end
        end
      when "no_notaria"
        if !value.nil? && value != ""
            logger.debug "Buscando por no. notaria: #{value}"
            if sql == ""
              sql += "no_notaria ILIKE ('%#{value}%') "
            else
              sql += "AND no_notaria ILIKE ('%#{value}%') "
            end
        end
      when "no_conclusion"
        if !value.nil? && value != ""
            logger.debug "Buscando por no. conclusión: #{value}"
            if sql == ""
              sql += "no_oficio_de_conclusion ILIKE ('%#{value}%') "
            else
              sql += "AND no_oficio_de_conclusion ILIKE ('%#{value}%') "
            end
        end
      when "observaciones"
        if !value.nil? && value != ""
            logger.debug "Buscando por observaciones: #{value}"
            if sql == ""
              sql += "observaciones ILIKE ('%#{value}%') "
            else
              sql += "AND observaciones ILIKE ('%#{value}%') "
            end
        end
      end
    end
    logger.debug "****************** SQL FINAL: #{sql}"
    documentos = Documento.where(sql).order(created_at: :desc)
    buzones = Buzone.where(documento_id: documentos.pluck(:id)).paginate(page:params[:page]).order(created_at: :desc) 
    return buzones
  end
  def cargar_tabla_principal
    #buzones = Buzone.paginate(page:params[:pagina],per_page:10).all
    #@buzones = Estado.paginate(page:params[:page],per_page:2).all
    respond_to do |format|
      format.turbo_stream { render partial: "home/turbo/tabla_principal", locals: { buzones: @buzones }}
    end
  end
  def set_busqueda
    
    valor_area = params[:area] == "ambos" ? "" : params[:area]
    parametros = {
      nombre_p: params[:nombre_paciente],
      apellido_pp: params[:apellido_paterno],
      apellido_mp: params[:apellido_materno],      
      nombre_n: params[:nombre_notario],
      apellido_pn: params[:apellido_paterno_notario],
      apellido_mn: params[:apellido_materno_notario],    
      nombre_r: params[:nombre_responsable],
      apellido_pr: params[:apellido_paterno_responsable],
      apellido_mr: params[:apellido_materno_responsable],
      nombre_ro: params[:nombre_responsable_opcional],
      apellido_pro: params[:apellido_paterno_responsable_opcional],
      apellido_mro: params[:apellido_materno_responsable_opcional],
      no_documento: params[:no_documento],
      area: valor_area,
      f_recp: params[:fecha_recepcion],
      f_disp: params[:fecha_disposicion],
      f_clon: params[:fecha_conclusion],
      no_inst: params[:no_inst],
      no_libro: params[:no_libro],
      no_notaria: params[:no_notaria],
      no_conclusion: params[:no_conclusion],
      observaciones: params[:observaciones],
      activa: true,
      user_id: current_user.id
    }
    busqueda= current_user.busqueda
    if !busqueda.nil?
      busqueda.update(parametros)
      redirect_to root_path and return
    else
      busqueda = Busqueda.new(parametros)
      if busqueda.save      
        redirect_to root_path
      else      
        redirect_to root_path, alert: "Error al guardar la búsqueda"
      end
    end
    
  end
end
