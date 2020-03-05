class Supermarket < ApplicationRecord
  has_many :products
  has_many :deals

  geocoded_by :address
  after_validation :geocode
end
