class Cart < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy

  def add_item(product_id, quantity)
    current_item = LineItem.find_by(product_id: product_id, cart: self)
    product = Product.find(product_id)
    if current_item
      current_item.update(quantity: current_item.quantity + 1)
    else
      current_item = LineItem.create!(
        product_id: product.id,
        quantity: quantity,
        cart: self,
        price: product.price
      )
    end
    current_item
  end
end
