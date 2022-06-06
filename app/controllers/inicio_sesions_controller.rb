class InicioSesionsController < ApplicationController
  before_action :set_inicio_sesion, only: %i[ show edit update destroy ]

  # GET /inicio_sesions or /inicio_sesions.json
  def index
    @inicio_sesions = InicioSesion.all
  end

  # GET /inicio_sesions/1 or /inicio_sesions/1.json
  def show
  end

  # GET /inicio_sesions/new
  def new
    @inicio_sesion = InicioSesion.new

  end

  # GET /inicio_sesions/1/edit
  def edit
  end

  # POST /inicio_sesions or /inicio_sesions.json
  def create
    @inicio_sesion = InicioSesion.new(inicio_sesion_params)

    respond_to do |format|
      if @inicio_sesion.save
        @base = InicioSesion.find_by email: @inicio_sesion.usuario
        if @base.to_s == @inicio_sesion.usuario
          format.html { redirect_to inicio_sesion_url(@inicio_sesion), notice: "Inicio sesion was successfully created." }
          format.json { render :show, status: :created, location: @inicio_sesion }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inicio_sesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inicio_sesions/1 or /inicio_sesions/1.json
  def update
    respond_to do |format|
      if @inicio_sesion.update(inicio_sesion_params)
        format.html { redirect_to inicio_sesion_url(@inicio_sesion), notice: "Inicio sesion was successfully updated." }
        format.json { render :show, status: :ok, location: @inicio_sesion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inicio_sesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inicio_sesions/1 or /inicio_sesions/1.json
  def destroy
    @inicio_sesion.destroy

    respond_to do |format|
      format.html { redirect_to inicio_sesions_url, notice: "Inicio sesion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inicio_sesion
      @inicio_sesion = InicioSesion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inicio_sesion_params
      params.require(:inicio_sesion).permit(:usuario, :password)
    end
end
