class Supermarket < ApplicationRecord
  has_many :products
  has_many :deals
  has_many :branches
end
