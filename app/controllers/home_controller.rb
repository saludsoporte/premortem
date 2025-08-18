class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def cargar_tabla_principal
    respond_to do |format|
      format.turbo_stream { render partial: "home/turbo/tabla_principal", locals: { documentos: Documento.all } }
    end
  end
end
