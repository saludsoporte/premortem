class HomeController < ApplicationController
  before_action :authenticate_user!
  def index    
    @buzones = Buzone.paginate(page:params[:page]).all    
  end
  def cargar_tabla_principal
    #buzones = Buzone.paginate(page:params[:pagina],per_page:10).all
    #@buzones = Estado.paginate(page:params[:page],per_page:2).all
    respond_to do |format|
      format.turbo_stream { render partial: "home/turbo/tabla_principal", locals: { buzones: @buzones }}
    end
  end
end
