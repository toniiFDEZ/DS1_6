class ProductosController < ApplicationController
  before_action :set_producto, only: %i[ show edit update destroy ]

  # GET /productos or /productos.json
  def index
    @productos = Producto.all
    if session[:id]
      @usuario = Usuario.find_by(id: session[:id])
    end
    @productos_usuario = Producto.where(IDusuario: @usuario.id)
  end

  # GET /productos/1 or /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos or /productos.json
  def create
    @producto = Producto.new(producto_params)
    if session[:id]
      @usuario = Usuario.find_by(id: session[:id])
    end
    @producto.IDusuario = @usuario.id

    respond_to do |format|
      if @producto.save
        format.html { redirect_to producto_url(@producto), notice: "Producto was successfully created." }
        format.json { render :show, status: :created, location: @producto }
        #@producto.IDusuario = session[:current_user_id] = user.id
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1 or /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to producto_url(@producto), notice: "Producto was successfully updated." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /productos/1 or /productos/1.json
  def destroy
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url, notice: "Producto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def make_image_featured
    imgs = ActiveStorage::Attachment.where(:record_id => params[:id])
    imgs.update_all(:fpic => 0)
    @images = ActiveStorage::Attachment.find(params[:img_id])
    @images.update_attributes(:fpic => true)
    redirect_back(fallback_location: posts_path) 
  end
    
  def reset_featured
    #@images = ActiveStorage::Attachment.all
    @images = ActiveStorage::Attachment.where(:record_id => params[:id])
    @images.update_all(:fpic => false)
    redirect_back(fallback_location: posts_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.require(:producto).permit(:nombre,:precio, :cantidad, images: [])
    end
end
