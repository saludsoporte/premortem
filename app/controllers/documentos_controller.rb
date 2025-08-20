class DocumentosController < ApplicationController
  before_action :set_documento, only: %i[ show edit update destroy  ]

  # GET /documentos or /documentos.json
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1 or /documentos/1.json
  def show
  end
  def captura_doc    
  end
  def guardar_captura        
    if validar_datos
      # Guardar los datos
      documento = Documento.new(        
        fecha_recepcion: params[:fecha_recepcion],
        no_memo: params[:no_memo],
        area_id: params[:area_id],
        no_libro: params[:no_libro],
        nombre: params[:nombre],
        fecha_disp: params[:fecha_disp],
        notario: params[:notario],
        no_notaria: params[:no_notaria],
        no_oficio_de_conclucion: params[:no_oficio_de_conclucion],
        fecha_conclucion: params[:fecha_conclucion],
        observaciones: params[:observaciones],
        archivo: params[:archivo]
      )
      if documento.save
        estado = Estado.find_by(estado:'Guardado')
        area = Area.find(documento.area_id)
        direccion = Direccion.find_by(clave:area.clave).nil?
        subdireccion = Subdireccion.find_by(clave:area.clave).nil?
        departamento = Departamento.find_by(clave:area.clave).nil?
        buzon = Buzone.new(
          estado_id: estado.id,          
          area_id:documento.area_id,
          direccion: direccion,
          subdireccion: subdireccion,
          departamento: departamento,
          documento_id:documento.id
        )
        buzon.save
        redirect_to root_path, notice: "Documento guardado exitosamente."
      end
    else
      redirect_to documentos_captura_doc_path(error:1)
    end
  end 
  def validar_datos        
    bandera = true
    if params[:fecha_recepcion].blank?      
      bandera = false
    elsif params[:fecha_disp].blank?      
      bandera = false
    elsif params[:no_memo].blank?      
      bandera = false
    elsif params[:no_libro].blank?      
      bandera = false
    elsif params[:area_id].blank?      
      bandera = false
    elsif params[:nombre].blank?      
      bandera = false
    elsif params[:notario].blank?      
      bandera = false
    elsif params[:no_notaria].blank?      
      bandera = false
    elsif params[:no_oficio_de_conclucion].blank?      
      bandera = false
    elsif params[:fecha_conclucion].blank?      
      bandera = false     
    elsif params[:archivo].blank?      
      bandera = false     
    else
      bandera = true
    end
    return bandera  
  end   
  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos or /documentos.json
  def create
    @documento = Documento.new(documento_params)

    respond_to do |format|
      if @documento.save
        format.html { redirect_to @documento, notice: "Documento was successfully created." }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1 or /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to @documento, notice: "Documento was successfully updated." }
        format.json { render :show, status: :ok, location: @documento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1 or /documentos/1.json
  def destroy
    @documento.destroy!

    respond_to do |format|
      format.html { redirect_to documentos_path, status: :see_other, notice: "Documento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento      
        @documento = Documento.find(params[:id])     
    end

    # Only allow a list of trusted parameters through.
    def documento_params
      params.require(:documento).permit(:fecha_recepcion, :no_memo, :area_id_id, :no_libro, :nombre, :fecha_disp, :notario, :no_notaria, :no_oficio_de_conclucion, :fecha_conclucion, :observaciones)
    end
end
