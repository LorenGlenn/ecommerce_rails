class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:order_item][:product_id])
    @product.stock -= 1
    @product.save
    @order_item = current_order.order_items.create(item_params)
    binding.pry
    redirect_to products_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
