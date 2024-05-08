class CheckoutsController < ApplicationController
  def show
    @cart = current_user.cart
  end
end
