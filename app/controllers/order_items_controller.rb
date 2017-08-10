class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:order_item][:product_id])
    @order = current_order
    @product.stock -= Integer(item_params[:quantity])
    @product.save
    @order_item = @order.order_items.create(item_params)
    @order.total += @product.cost * @order_item.quantity
    @order.save
    redirect_to products_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
