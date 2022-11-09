class Flat < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
end
