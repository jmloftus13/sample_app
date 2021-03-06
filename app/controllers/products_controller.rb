class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json

def index
  #byebug is the interactive debugger
  #byebug
    if params[:q]
      search_term = params[:q]
        if Rails.env == "development"
          @products = Product.where("name LIKE ?", "%#{search_term}%")
        else
          @products = Product.where("name ilike ?", "%#{search_term}%")
        end
    else
      @products = Product.all
    end
end

  # GET /products/1
  # GET /products/1.json
  def show
    if (@product.comments.present?)
      @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], per_page: 3)
      @products = Product.find(params[:id])
      # assuming you load the @product in prepare_product
      #commenting out teh below line to see if it fixes Action Cable issue in 6.14
      #@product.viewed!
    end

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @user = current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to :back, notice: 'redirected to previous page.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :price)
    end
end
