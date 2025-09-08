class HomeController < ApplicationController
  before_action :authenticate_user!
  def index    
    busqueda= current_user.busqueda
    if busqueda.activa
      @buzones = consultar_busqueda(busqueda)
    else
      @buzones = Buzone.paginate(page:params[:page]).all.order(created_at: :desc)    
    end    
  end
  def consultar_busqueda(busqueda)
    
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
      f_recp: params[:f_recp],
      f_disp: params[:f_disp],
      f_clon: params[:f_clon],
      no_inst: params[:no_inst],
      no_libro: params[:no_libro],
      no_notaria: params[:no_notaria],
      no_conclusion: params[:no_conclusion],
      activa: true
    }    
    busqueda = Busqueda.new(parametros)
    if busqueda.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "Error al guardar la búsqueda"
    end
  end
end
