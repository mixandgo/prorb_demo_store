class StripeCheckoutHandlersController < ApplicationController
  def show
    session = Stripe::Checkout::Session.retrieve(id: params[:session_id])
    # Do something after the products have been purchased
    redirect_to root_path, notice: "Thank you for your purchase"
  rescue Stripe::InvalidRequestError => e
    redirect_to root_path, alert: "Sorry, we've got an error from Stripe: #{e}"
  end
end
