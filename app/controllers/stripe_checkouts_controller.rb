class StripeCheckoutsController < ApplicationController
  def new
    payment_processor = current_user.set_payment_processor(:stripe)
    args = {
      allow_promotion_codes: false,
      automatic_tax: { enabled: false },
      # consent_collection: { terms_of_service: :required },
      customer_update: { address: :auto },
      mode: :payment,
      ui_mode: :embedded,
      line_items: current_user.cart.line_items.map do |i|
        { price: i.product.stripe_price_id, quantity: i.quantity }
      end,
      metadata: {},
      return_url: stripe_checkout_handler_url
    }
    @checkout_session = payment_processor.checkout(**args)
  end
end
