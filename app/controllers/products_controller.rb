class ProductsController < ApplicationController
  
  def index
    @products = Product.all
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

  private

  def product_params
    params.require(:product).permit(:name, :cost, :description, :image)
  end
end
