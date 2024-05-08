class CartsController < ApplicationController
  def update
    @cart = current_user.cart

    @cart.add_item(params[:product_id], params[:quantity])

    if @cart.save
      flash[:notice] = "Product added to cart"
      render turbo_stream: [
        turbo_stream.replace(@cart),
        turbo_stream.update("checkout-subtotal", @cart.total),
        turbo_stream.replace("flash", partial: "shared/flashes")
      ]
    else
      flash[:alert] = "Cannot add product to cart"
      render turbo_stream: [
        turbo_stream.replace("flash", partial: "shared/flashes")
      ]
    end
  end
end
