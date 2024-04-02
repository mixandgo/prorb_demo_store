class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
end
