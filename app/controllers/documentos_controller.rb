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
    if validar_datos[0]
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
      redirect_to documentos_captura_doc_path(error:validar_datos[1],datos:validar_datos[2])
    end
  end 
  def validar_datos    
    @errores = [] 
    datos = []   
    bandera = true
    if params[:fecha_recepcion].blank?      
      bandera = false
      @errores.push(1)
      datos.push("")
    else
      datos.push(params[:fecha_recepcion])
    end   
    if params[:fecha_disp].blank?      
      bandera = false
      @errores.push(2)
      datos.push("")
    else
      datos.push(params[:fecha_disp])
    end
    if params[:no_memo].blank?      
      bandera = false
      @errores.push(3)  
      datos.push("")
    else
      datos.push(params[:no_memo])
    end
    if params[:no_libro].blank?      
      bandera = false
      @errores.push(4)
      datos.push("")
    else
      datos.push(params[:no_libro])
    end
    if params[:area_id].blank?      
      bandera = false
      @errores.push(5)
      datos.push("")
    else
      datos.push(params[:area_id])
    end
    if params[:nombre].blank?
      bandera = false
      @errores.push(6)
      datos.push("")
    else
      datos.push(params[:nombre])
    end
    if params[:notario].blank?      
      bandera = false
      @errores.push(7)
      datos.push("")
    else
      datos.push(params[:notario])
    end
    if params[:no_notaria].blank?      
      bandera = false
      @errores.push(8)
      datos.push("")
    else
      datos.push(params[:no_notaria])
    end
    if params[:no_oficio_de_conclucion].blank?      
      bandera = false
      @errores.push(9)
      datos.push("")
    else
      datos.push(params[:no_oficio_de_conclucion])
    end
    if params[:fecha_conclucion].blank?      
      bandera = false
      @errores.push(10)
      datos.push("")
    else
      datos.push(params[:fecha_conclucion])
    end
    if params[:archivo].blank?      
      bandera = false
      @errores.push(11)    
      datos.push("")
    end
    return bandera,@errores,datos
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
        estado = Estado.find_by(estado:'Guardado')
        area = Area.find(@documento.area_id)
        direccion = Direccion.find_by(clave:area.clave).nil?
        subdireccion = Subdireccion.find_by(clave:area.clave).nil?
        departamento = Departamento.find_by(clave:area.clave).nil?
        buzon = Buzone.new(
          estado_id: estado.id,          
          area_id:@documento.area_id,
          direccion: direccion,
          subdireccion: subdireccion,
          departamento: departamento,
          documento_id:@documento.id
        )
        buzon.save
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
      params.require(:documento).permit(:fecha_recepcion, :no_memo, :area_id, :no_libro, :nombre, :fecha_disp, :notario, :no_notaria, :no_oficio_de_conclucion, :fecha_conclucion,:responsable_de_paciente, :observaciones,:archivo)
    end
end
