class ProductsController < ApplicationController

  def index
    @products = Product.where("stock > 0")
    @order_item = OrderItem.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "You successfully created a product!"
      session[:product_id] = @product.id
      redirect_to "/products"
    else
      flash[:alert] = "There was a problem saving this product."
      redirect_to '/products/new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    binding.pry
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "You successfully deleted the product!"
      redirect_to "/products"
    else
      flash[:alert] = "There was a problem deleting this product!"
      redirect_to "/products"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :cost, :description, :image, :id, :stock)
  end
end
